# ClariceOS-Theme — Fase 2: Auditoria final dos assets

## Escopo
Auditoria dos assets implementáveis em `extras/reference_visual_kit/assets`:
- PNG: clipping, margem útil, proporção e canvas
- SVG: presença de `<text>` embutido

## Resultado geral
- PASS: 52
- WARN: 0
- FAIL: 0

## Correções aplicadas nesta fase
- Reconciliadas as 3 pastas (`folder-blue`, `folder-ice`, `folder-dark`) usando a proporção corrigida da revisão anterior.
- Reaplicado padding seguro em canvas padronizado `70x52` para impedir toque na borda.
- Atualizado `frozen_component_specs.json` com a geometria final dessas pastas.

## Critérios usados
- Sliders: margens mínimas de segurança para sombra (`>=5px` horizontal e `>=8px` vertical)
- Controles com sombra (botões, pills, toggles): sem clipping detectado e com folga visível
- Pastas: proporção corrigida preservada e ao menos `1px` de margem em todos os lados
- SVGs: proibido `<text>` nos assets implementáveis

## Observações
- `mockups_clean/` e `reference/` permanecem como material de referência e não entram nesta auditoria de assets implementáveis.
- SVGs de pasta são wrappers com imagem embutida para preservar a fidelidade visual exata ao mockup aprovado.
- Esta fase não valida runtime real no GNOME; isso pertence às fases de Shell/GTK.

| Arquivo | Tipo | Canvas | BBox / View | Margens | Status | Notas |
|---|---:|---:|---|---|---|---|
| `button-dark-default.png` | PNG | 154x53 | 4,5,150,50 | L4 T5 R4 B3 | **PASS** | Safe margins present. |
| `button-dark-primary.png` | PNG | 198x53 | 4,5,194,50 | L4 T5 R4 B3 | **PASS** | Safe margins present. |
| `button-light-default.png` | PNG | 170x51 | 3,4,167,49 | L3 T4 R3 B2 | **PASS** | Safe margins present. |
| `button-light-primary.png` | PNG | 202x53 | 4,5,198,50 | L4 T5 R4 B3 | **PASS** | Safe margins present. |
| `checkbox-dark-checked.png` | PNG | 28x28 | 2,2,26,26 | L2 T2 R2 B2 | **PASS** | No clipping detected. |
| `checkbox-light-checked.png` | PNG | 28x28 | 1,1,27,27 | L1 T1 R1 B1 | **PASS** | No clipping detected. |
| `clock-dark-icon.png` | PNG | 50x50 | 3,3,47,47 | L3 T3 R3 B3 | **PASS** | No clipping detected. |
| `folder-blue.png` | PNG | 70x52 | 4,4,67,50 | L4 T4 R3 B2 | **PASS** | Corrected proportion preserved with safety padding. |
| `folder-dark.png` | PNG | 70x52 | 3,3,69,51 | L3 T3 R1 B1 | **PASS** | Corrected proportion preserved with safety padding. |
| `folder-ice.png` | PNG | 70x52 | 3,4,67,50 | L3 T4 R3 B2 | **PASS** | Corrected proportion preserved with safety padding. |
| `gear-dark-icon.png` | PNG | 70x70 | 1,5,56,60 | L1 T5 R14 B10 | **PASS** | No clipping detected. |
| `magnifier-dark-icon.png` | PNG | 74x74 | 9,9,65,65 | L9 T9 R9 B9 | **PASS** | No clipping detected. |
| `radio-dark-on.png` | PNG | 26x26 | 2,2,24,24 | L2 T2 R2 B2 | **PASS** | No clipping detected. |
| `radio-light-on.png` | PNG | 26x26 | 1,1,25,25 | L1 T1 R1 B1 | **PASS** | No clipping detected. |
| `search-light-icon.png` | PNG | 70x70 | 9,9,65,65 | L9 T9 R5 B5 | **PASS** | No clipping detected. |
| `shell-pill-dark.png` | PNG | 170x40 | 2,4,168,36 | L2 T4 R2 B4 | **PASS** | Safe margins present. |
| `shell-pill-light.png` | PNG | 170x40 | 2,4,168,36 | L2 T4 R2 B4 | **PASS** | Safe margins present. |
| `slider-dark.png` | PNG | 374x44 | 5,9,369,35 | L5 T9 R5 B9 | **PASS** | Shadow margins preserved after prior correction. |
| `slider-light.png` | PNG | 374x44 | 5,8,369,36 | L5 T8 R5 B8 | **PASS** | Shadow margins preserved after prior correction. |
| `star-outline.png` | PNG | 70x70 | 5,5,65,63 | L5 T5 R5 B7 | **PASS** | No clipping detected. |
| `toggle-dark-accent.png` | PNG | 76x42 | 2,5,74,37 | L2 T5 R2 B5 | **PASS** | Safe margins present. |
| `toggle-dark-off.png` | PNG | 76x42 | 2,5,74,37 | L2 T5 R2 B5 | **PASS** | Safe margins present. |
| `toggle-light-accent.png` | PNG | 76x42 | 2,5,74,37 | L2 T5 R2 B5 | **PASS** | Safe margins present. |
| `toggle-light-off.png` | PNG | 76x42 | 2,5,74,37 | L2 T5 R2 B5 | **PASS** | Safe margins present. |
| `toggle-light-on.png` | PNG | 76x42 | 2,5,74,37 | L2 T5 R2 B5 | **PASS** | Safe margins present. |
| `toggle-light-outline.png` | PNG | 76x42 | 2,5,74,37 | L2 T5 R2 B5 | **PASS** | Safe margins present. |
| `button-dark-default.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `button-dark-primary.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `button-light-default.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `button-light-primary.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `checkbox-dark-checked.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `checkbox-light-checked.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `clock-dark-icon.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `folder-blue.svg` | SVG | - | - | - | **PASS** | No text nodes. Image-wrapper SVG. |
| `folder-dark.svg` | SVG | - | - | - | **PASS** | No text nodes. Image-wrapper SVG. |
| `folder-ice.svg` | SVG | - | - | - | **PASS** | No text nodes. Image-wrapper SVG. |
| `gear-dark-icon.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `magnifier-dark-icon.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `radio-dark-on.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `radio-light-on.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `search-light-icon.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `shell-pill-dark.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `shell-pill-light.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `slider-dark.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `slider-light.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `star-outline.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `toggle-dark-accent.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `toggle-dark-off.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `toggle-light-accent.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `toggle-light-off.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `toggle-light-on.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
| `toggle-light-outline.svg` | SVG | - | - | - | **PASS** | No text nodes. Vector SVG. |
