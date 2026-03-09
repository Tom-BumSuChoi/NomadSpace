---
name: create-design-system-rules
description: Generates custom design system rules for the user's codebase. Use when user says "create design system rules", "generate rules for my project", "set up design rules", "customize design system guidelines", or wants to establish project-specific conventions for Figma-to-code workflows. Requires Figma MCP server connection.
metadata:
  mcp-server: figma
---

# Create Design System Rules

## Overview

Generates custom design system rules tailored to the project. Guides AI agents to produce consistent code when implementing Figma designs.

## Required Workflow

### Step 1: Run the Tool

Call `create_design_system_rules(clientLanguages="swift", clientFrameworks="swiftui")` for iOS/SwiftUI projects.

### Step 2: Analyze the Codebase

- Component organization (DesignSystem, Features modules)
- Styling approach (SwiftUI modifiers, design tokens)
- Naming conventions (PascalCase for components)
- Architecture (TMA layers, module structure)

### Step 3: Generate Project-Specific Rules

Include:
- Component paths (e.g., DesignSystem, Features/*/Sources)
- Figma MCP integration flow (get_design_context → get_screenshot → implement)
- Asset handling (use localhost sources directly, no new icon packages)
- SwiftUI conventions for this project

### Step 4: Save Rules

For Cursor: `.cursor/rules/figma-design-system.mdc` with YAML frontmatter and `globs` for relevant paths.
