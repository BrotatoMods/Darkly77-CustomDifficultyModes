# Darkly77 - Custom Difficulty Modes

Adds some hardcore custom difficulty modes:

- Heaven or Hell
- No-Hit (D2)
- No-Hit (D5)

"Heaven or Hell" is a no-hit difficulty, but you also gain +100% Damage modifications.

## Notes for Modders

### Value

Custom difficulties are just custom items. The only caveat with them is that both the type of enemies, and the number of elites/hordes, depends on the `value` you set. This is because vanilla doesn't handle them with effects, it uses the difficulty number. See these parts in vanilla:

- `init_elites_spawn` (*run_data.gd*) - Sets elite spawns based on difficulty `value`.
- `_physics_process` (*wave_manager.gd*) - Sets group spawns, look for for `RunData.get_current_difficulty`.

This means that `value` must be >= `0`, or nothing will spawn. So you can't, for example, use `-1`, which just makes waves empty.

*This is a bit of a shame because it means that, if a player completes your custom difficulty, then the next difficulty above that will be unlocked. So try not to make them too easy* 😄

### Showing the Difficulty

The custom difficulty isn't shown anywhere. The pause menu still says eg. "Danger 3". The effects **are** saved on your run, so if you quit and reload then they're still there, but there's no indication of which custom difficulty you're currently using.

One approach to fix this would be to make it so that custom difficulties add an item to your inventory, and that item has all the special effects:

- You could still list the effects in the difficulty's effects, but any custom effects added to the difficulty itself would need to be null effects, with custom translation strings that replicate the actual effect.
- Then you can use a starting item effect (`effect_starting_item`) to add your custom item.

## Screenshots

![](.docs/custom-difficulty-modes.png)
