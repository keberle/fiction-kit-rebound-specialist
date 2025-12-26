#!/usr/bin/env python3
"""Validate draft folder structure and artifacts"""

import re
import sys
from pathlib import Path
from typing import List

def validate_folder_name(folder_path: Path) -> List[str]:
    """Check draft folder naming convention"""
    errors = []
    
    if not re.match(r'^\d{3}-[a-z0-9-]+$', folder_path.name):
        errors.append(f"Invalid folder name: {folder_path.name} (should be ###-kebab-case)")
    
    return errors

def validate_required_files(folder_path: Path) -> List[str]:
    """Check all required files exist"""
    required = ['idea.md', 'clarify.md', 'plan.md', 'tasks.md', 'analyze.md', 'feedback.md']
    errors = []
    
    for filename in required:
        if not (folder_path / filename).exists():
            errors.append(f"Missing required file: {filename}")
    
    return errors

def validate_idea(idea_path: Path) -> List[str]:
    """Check idea.md has required sections"""
    required = ['Intent Summary', 'Motivation', 'Scope', 'Desired Outcome']
    content = idea_path.read_text(encoding='utf-8')
    errors = []
    
    for section in required:
        if f"**{section}" not in content and f"## {section}" not in content:
            errors.append(f"Missing required section in idea.md: {section}")
    
    # Check for solution proposals (anti-pattern)
    if re.search(r'(we should|I will|rewrite|change)\s', content, re.IGNORECASE):
        errors.append("Warning: idea.md may contain solution proposals (should be intent only)")
    
    return errors

def validate_tasks(tasks_path: Path) -> List[str]:
    """Check tasks.md uses checkbox format"""
    content = tasks_path.read_text(encoding='utf-8')
    errors = []
    
    # Check for checkbox format
    if '- [ ]' not in content and '- [X]' not in content and '- [x]' not in content:
        errors.append("tasks.md does not use checkbox format (- [ ] or - [X])")
    
    # Check for task IDs
    task_ids = re.findall(r'\*\*T(\d{3})', content)
    if task_ids:
        # Verify sequential
        for i, tid in enumerate(sorted(task_ids), 1):
            expected = f"{i:03d}"
            if tid != expected:
                errors.append(f"Task ID gap or misordering: found T{tid}, expected T{expected}")
    else:
        errors.append("No task IDs found (should use **T###: format)")
    
    return errors

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: validate_draft.py <draft-folder-path>")
        sys.exit(1)
    
    draft_path = Path(sys.argv[1])
    
    if not draft_path.exists() or not draft_path.is_dir():
        print(f"❌ Error: Path is not a directory: {draft_path}")
        sys.exit(1)
    
    all_errors = []
    all_errors.extend(validate_folder_name(draft_path))
    all_errors.extend(validate_required_files(draft_path))
    
    idea_file = draft_path / 'idea.md'
    if idea_file.exists():
        all_errors.extend(validate_idea(idea_file))
    
    tasks_file = draft_path / 'tasks.md'
    if tasks_file.exists():
        all_errors.extend(validate_tasks(tasks_file))
    
    if all_errors:
        print(f"❌ Validation errors in {draft_path.name}:")
        for error in all_errors:
            print(f"  - {error}")
        sys.exit(1)
    else:
        print(f"✅ Draft {draft_path.name} passes validation")
        sys.exit(0)
