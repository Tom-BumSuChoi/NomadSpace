---
name: code-connect-components
description: Connects Figma design components to code components using Code Connect. Use when user says "code connect", "connect this component to code", "connect Figma to code", "map this component", "link component to code", "create code connect mapping", "add code connect", "connect design to code", or wants to establish mappings between Figma designs and code implementations. Requires Figma MCP server connection.
metadata:
  mcp-server: figma
---

# Code Connect Components

## Overview

Connects Figma design components to code implementations using Figma's Code Connect. Analyzes Figma structure, searches codebase for matching components, and establishes mappings.

## Prerequisites

- Figma MCP server connected
- Figma URL with `node-id` parameter required
- Component must be published to team library (Code Connect only works with published components)
- Code Connect available on Organization/Enterprise plans

## Required Workflow

### Step 1: Get Code Connect Suggestions

Call `get_code_connect_suggestions(fileKey=":fileKey", nodeId="1:2")`.

**URL format:** `node-id=1-2` → convert to `nodeId=1:2` (colon for tool)

### Step 2: Scan Codebase for Matching Components

Search for component names, structure, props. Check `src/components/`, `app/components/`, `lib/ui/`, DesignSystem paths.

### Step 3: Present Matches to User

Present findings and let user choose which mappings to create.

### Step 4: Create Code Connect Mappings

Call `send_code_connect_mappings` with accepted mappings. Use `label` for framework: 'SwiftUI', 'Swift UIKit' for iOS.

## Valid Labels

- iOS: 'Swift UIKit', 'Objective-C UIKit', 'SwiftUI'
- Web: 'React', 'Vue', 'Svelte', etc.
- Android: 'Compose', 'Kotlin', etc.
