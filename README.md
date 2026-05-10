credits to the other fork, theres helped me significantly but i still did some stuff of my own, i used there code as a base, but implemented extra features, more to come soon.

## Post Processing / Screen Effects

This fork supports Vivify-style screen post processing through `Blit`, plus friendlier aliases:

- `Blit`
- `PostProcess`
- `PostProcessing`
- `ScreenEffect`

All four events run through the same render pipeline. Use a material from `bundleAndroid2021.vivify` as the effect material.

```json
{
  "b": 0,
  "t": "ScreenEffect",
  "d": {
    "material": "Materials/ChromaticAberration.mat",
    "duration": -1,
    "order": "AfterMainEffect",
    "priority": 10,
    "properties": [
      { "id": "_Intensity", "type": "Float", "value": 0.65 }
    ]
  }
}
```

`duration: -1` keeps the effect active until it is cleared. `duration: 0` applies it for the current frame only, and positive values are measured in beats.

To clear matching effects:

```json
{
  "b": 64,
  "t": "ScreenEffect",
  "d": {
    "material": "Materials/ChromaticAberration.mat",
    "clear": true
  }
}
```

Screen textures created with `CreateScreenTexture` now default to the active camera size, so `xRatio` and `yRatio` can be used for half-res or quarter-res post-processing buffers without hardcoding Quest render dimensions.
