# Turn-Zylinder
Godot 'look_at' function test

Just a few codelines to demonstrate use of spatial 'look_at' function and some strange behaviour resulting from this code.

System specs:
Windows 10, Godot 3.2.1

Intention:
Want to turn the cylinder horizontal with mouse click and paste (or touch click and paste).

On mouse button press the movement is initialized by looking for difference vector of normalized z axis and normalized
and localized touch vector in z-plane. Subsequent mouse movement triggers 'look_at' to (touch vector + diff vector, globalized).

This works out fine for first click and paste, but creates a mess for subsequent click and pastes. In the console you see
that each initiated click gives perfect normalized vectors ('kp', 'look_at_lokal' always opposit to 'transform.basis.z',
as 'look_at' directs -Z). Nevertheless the cylinder jumps on subsequent clicks.

What is also remarkable are the 'out' values in console, there are different values for outputting transform.basis.x / y
or outputting 'transform.basis' in whole. This is not the case for initial click ('in'-values).
