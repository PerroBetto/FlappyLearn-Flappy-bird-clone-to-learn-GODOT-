[33mcommit 9c92db6061eda80a51cb1216f899104362a88785[m[33m ([m[1;36mHEAD[m[33m -> [m[1;32mmain[m[33m)[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Wed Sep 10 14:48:26 2025 -0600

    Added basic functionality to resolution option button.

[33mcommit 15fdf7fce3650904fb9601789b9331e205b88d4f[m[33m ([m[1;31morigin/main[m[33m, [m[1;31morigin/HEAD[m[33m)[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Wed Sep 10 12:56:29 2025 -0600

    changed project settings so the game can handle different full screen resolutions properly.

[33mcommit 565698af4548d2bce1e115bc60f2645c0ac33d87[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Tue Sep 9 20:45:04 2025 -0600

    Added Windowed Mode button functionality.

[33mcommit 9473ce892f370f550b11279c831a2807dff6ce54[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Tue Sep 9 15:12:00 2025 -0600

    fixed issue. Now all thats left is: Allow settings menu to affect settings, add sound effects, keybinding.

[33mcommit e84098ff1d9ce95972f0333cc2e37e3608644ddb[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Tue Sep 9 14:48:42 2025 -0600

    Added save functionality to settings, added SOME load funcitonality to settings.
    At this moment, the save scene crashes the game.

[33mcommit 248c8cc9f83f277f0763fd416550a29b1ce30275[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Mon Sep 8 18:52:12 2025 -0600

    Updated level to hide scoreboard when settings are opened.

[33mcommit 3ed65d14e4667a7563f7681575382b9abad29ce2[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Mon Sep 8 18:05:08 2025 -0600

    added delete save functionality

[33mcommit 11009bb6527ce85777a9271598fa5b790a9f6146[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Mon Sep 8 17:56:39 2025 -0600

    Reverted class Save_Settings change as it ended up breaking the game. Added open close functionality to Settings scene in main menu and levels.
    This settings menu is very clunky, the implementation of the menu into the other scenes is shoddy at best, I do not like it but I would like to get the game done lol

[33mcommit fd4569657cddb43ab9ffc9207d7d8116b1e02676[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Mon Sep 8 14:45:36 2025 -0600

    Added flappy.settings to AppData Roaming user:// data. To be manipulated as the settings folder using JSON.
    Changed main_menu.gd and level_control.gd to extend Save_Setting

[33mcommit ee261d143d2088a2b47287f417b91cd8b4b85d92[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Thu Sep 4 20:52:29 2025 -0600

    folder updates

[33mcommit 29f078817097fc6fe368e2b6fa77b0f6cea1a306[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Mon Sep 1 20:07:45 2025 -0600

    Changed score_board_ui to be correct and consistent with other ui, added settings scene with skeleton for settings ui

[33mcommit c616dd4a95e9a0fdacfd626b494fd3356fec1c88[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Mon Sep 1 14:12:40 2025 -0600

    small changes

[33mcommit 6a26b8c094443b59b15c19c28d5877d415be1ef5[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Wed Aug 27 20:44:16 2025 -0600

    added more disfunctional UI buttons, and messing around with screen size stuff.

[33mcommit a480f91ebf1f699653c0c04bf7dddcdd75086414[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Wed Aug 27 18:56:34 2025 -0600

    Added visual and interactable functionality to menu buttons in Level

[33mcommit b81c477453ac55c0b1475a08e1ee79b0a20d1778[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Wed Aug 27 14:37:11 2025 -0600

    Renamed README to README.md

[33mcommit 12ef4c677f3b3d781c5f50afd399f5e25b68dc13[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Wed Aug 27 14:33:44 2025 -0600

    Updated README

[33mcommit 13968bba8a18add1c789746a5f0bb5a224464260[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Wed Aug 27 14:29:48 2025 -0600

    Added simple pause functionality by adding Global.Paused : bool. Game can be paused using the esc key, and only in Level scene

[33mcommit 5034d2a99ea62f0592a13a1705f2e59fbaf0c327[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Wed Aug 27 13:36:40 2025 -0600

    added buttons to Menu.tscn, Play button that changes scene to level scene to allow the game to be played through the menu

[33mcommit e656b6b7d2535deb9fd80894e00d44293d9799e5[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Wed Aug 27 12:23:23 2025 -0600

    Added bird to the title screen, adjusted window size properties

[33mcommit 575891be1081bcaded74c8271a543811dd82d136[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Tue Aug 26 17:56:48 2025 -0600

    added enum STATE to bird

[33mcommit 54edee524517650433391136a0489c4023130acb[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Thu Aug 14 20:23:21 2025 -0600

    created save data, a moving floor, finished UI system (for scores)

[33mcommit ecf5429e50001552551b6b1fdf2e803cf1df38f6[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Sun Aug 10 15:59:08 2025 -0600

    added README

[33mcommit c77f1414eda4f3d2d157a0abda97f3e8a2d9a659[m
Author: PerroBetto <milo8600@gmail.com>
Date:   Sun Aug 10 15:56:38 2025 -0600

    first commit
