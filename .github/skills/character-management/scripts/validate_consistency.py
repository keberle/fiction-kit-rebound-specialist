#!/usr/bin/env python3
"""Validate character consistency in scene files"""

import re
import sys
from pathlib import Path
from typing import Dict, List

def load_character_file(char_path: Path) -> Dict:
    """Parse character file into structured data"""
    content = char_path.read_text(encoding='utf-8')
    character = {
        'name': char_path.stem.replace('-', ' ').title(),
        'physical': extract_bullets(content, 'Physical Description'),
        'voice': extract_bullets(content, 'Voice Patterns'),
        'mannerisms': extract_bullets(content, 'Mannerisms')
    }
    return character

def extract_bullets(content: str, section: str) -> List[str]:
    """Extract bullet points from a section"""
    pattern = f"\\*\\*{section}\\*\\*:?(.*?)(?=\\*\\*|$)"
    match = re.search(pattern, content, re.DOTALL)
    if not match:
        return []
    
    bullets = re.findall(r'^[\s]*[-*]\s+(.+)$', match.group(1), re.MULTILINE)
    return [b.strip() for b in bullets]

def check_scene_consistency(scene_path: Path, characters: Dict) -> List[str]:
    """Check if scene uses characters consistently"""
    content = scene_path.read_text(encoding='utf-8')
    warnings = []
    
    for char_name, char_data in characters.items():
        # Simple name matching (case-insensitive)
        char_first = char_name.split()[0]
        if char_first.lower() not in content.lower():
            continue  # Character not in scene
        
        # Check for invented physical details (common anti-patterns)
        invented_patterns = [
            (r'(?:drove|parked|got into|climbed out of)\s+(?:his|her|their)\s+\w+\s+(?:car|truck|SUV|vehicle)', 'vehicle'),
            (r'(?:sat|slumped|collapsed)\s+(?:in|into|on)\s+(?:the|a|an)\s+(?:leather|wooden|metal)\s+\w+', 'furniture'),
            (r'(?:wore|dressed in|wearing)\s+\w+', 'clothing')
        ]
        
        for pattern, detail_type in invented_patterns:
            matches = re.finditer(pattern, content, re.IGNORECASE)
            for match in matches:
                detail = match.group(0)
                # Check if this detail is in character file
                found = any(
                    detail.lower() in item.lower() 
                    for items in [char_data['physical'], char_data['mannerisms']] 
                    for item in items
                )
                if not found:
                    warnings.append(
                        f"⚠️  Potential invented {detail_type} for {char_name}: '{detail}' "
                        f"(not found in character file)"
                    )
    
    return warnings

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: validate_consistency.py <scene-file>")
        sys.exit(1)
    
    scene_file = Path(sys.argv[1])
    chars_dir = Path('elements/characters')
    
    if not scene_file.exists():
        print(f"❌ Scene file not found: {scene_file}")
        sys.exit(1)
    
    if not chars_dir.exists():
        print(f"❌ Characters directory not found: {chars_dir}")
        sys.exit(1)
    
    # Load all character files
    characters = {}
    for char_file in chars_dir.glob('*.md'):
        char_data = load_character_file(char_file)
        characters[char_data['name']] = char_data
    
    # Check scene
    warnings = check_scene_consistency(scene_file, characters)
    
    if warnings:
        print(f"⚠️  Character consistency warnings in {scene_file.name}:")
        for warning in warnings:
            print(f"  {warning}")
        print("\n💡 Tip: Either add these details to character files or use generic descriptions")
        sys.exit(1)
    else:
        print(f"✅ Character usage in {scene_file.name} appears consistent")
        sys.exit(0)
