---
name: implement-design
description: Translates Figma designs into production-ready code with 1:1 visual fidelity. Use when implementing UI from Figma files, when user mentions "implement design", "generate code", "implement component", "build Figma design", provides Figma URLs, or asks to build components matching Figma specs. Requires Figma MCP server connection.
metadata:
  mcp-server: figma
---

# Implement Design

## Overview

This skill provides a structured workflow for translating Figma designs into production-ready code with pixel-perfect accuracy. It ensures consistent integration with the Figma MCP server, proper use of design tokens, and 1:1 visual parity with designs.

## Prerequisites

- Figma MCP server must be connected and accessible
- User must provide a Figma URL in the format: `https://figma.com/design/:fileKey/:fileName?node-id=1-2`
- Project should have an established design system or component library (preferred)

## Required Workflow

**Follow these steps in order. Do not skip steps.**

### Step 1: Get Node ID

Parse URL: `https://figma.com/design/:fileKey/:fileName?node-id=1-2`
- **File key:** segment after `/design/`
- **Node ID:** value of `node-id` query parameter (e.g., `1-2`)

### Step 2: Fetch Design Context

Run `get_design_context(fileKey=":fileKey", nodeId="1-2")` to get layout, typography, colors, component structure.

### Step 3: Capture Visual Reference

Run `get_screenshot(fileKey=":fileKey", nodeId="1-2")` for visual validation.

### Step 4: Download Required Assets

- If Figma MCP returns a `localhost` source: use it directly
- DO NOT import new icon packages; all assets come from Figma payload
- DO NOT use placeholders if localhost source is provided

### Step 5: Translate to Project Conventions

- Replace Tailwind/React output with project's framework (SwiftUI for iOS)
- Reuse existing components from DesignSystem
- Use project's color system, typography, spacing tokens

### Step 6: Achieve 1:1 Visual Parity

- Prioritize Figma fidelity
- Use design tokens from Figma where available
- Follow WCAG for accessibility

### Step 7: Validate Against Figma

Check layout, typography, colors, interactive states, assets, accessibility.

## Asset Rules

- IMPORTANT: Use localhost sources from Figma MCP server directly
- DO NOT install new icon libraries
- DO NOT create placeholders when localhost source is provided
