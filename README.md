# Darkly77 - Custom Difficulty Modes

Adds some hardcore custom difficulty modes:

- Heaven or Hell
- No-Hit (D2)
- No-Hit (D5)

"Heaven or Hell" is a no-hit difficulty, but you also gain +100% Damage modifications.

## Notes for Modders

Custom difficulties behave similarly to items, but they are not added to `RunData.items` (unlike items/characters). They apply their effects by adding them to `RunData.effects`, which makes the effects permanent for the current run.

You can find where the current difficulty is used in the vanilla code by searching for `get_current_difficulty` in *run_data.gd*, and `RunData.get_current_difficulty()` across the rest of vanilla's codebase.

### Value

The `value` of a difficulty's DifficulyData resource sets the danger level. This is important to note because this is different to how every other gameplay-impacting effect is handled, which uses actual effects (ie. `RunData.effects["effect_key"]`).

The `value` affects both the type of enemies that can be spawned, and the number of elites/hordes.  See these parts in vanilla:

- `init_elites_spawn` (*run_data.gd*) - Sets elite spawns based on difficulty `value`.
- `_physics_process` (*wave_manager.gd*) - Sets group spawns, via `RunData.get_current_difficulty`.

This means that `value` must be >= `0`, or nothing will spawn. Using `-1` makes waves empty.

*This is a bit of a shame because it means that, if a player completes your custom difficulty, then the next difficulty above that will be unlocked. So try not to make them too easy* 😄

### Showing the Difficulty

EDIT: The approach outlined below doesn't work, because the `starting_item` effect is applied after you select a weapon -- see `on_element_pressed` in *weapon_selection.gd*. So if you use it on a difficulty, it's too late for the effect to be applied. The fix for this would be to add a custom version of `starting_item` that triggers after you select a difficulty.

The custom difficulty isn't shown anywhere. For example, the pause menu still says "Danger 3" if `value` is `3`, even if you're using a custom difficulty.

The effects *are* saved on your run, so if you quit and reload then they're still there, but there's no indication of which custom difficulty you're currently using.

One approach to fix this would be to make it so that custom difficulties add an item to your inventory, and that item has all the special effects:

- You could still list the effects in the difficulty's effects with *null_effect.gd*.
- Then you can use a starting item effect (`effect_starting_item`) to add your custom item.

## Screenshots

![](.docs/custom-difficulty-modes.png)
