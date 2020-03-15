ffi = require("ffi")
raylib = require("raylib")
raygui = require("raygui")


function Main()
    print("Loading raylib...")

    raylib.InitWindow(800, 600, "test")

    raylib.SetTargetFPS(60);

    raygui.GuiEnable();

    while not raylib.WindowShouldClose() do
        raylib.BeginDrawing();

            raylib.ClearBackground(RAYWHITE)
            
        raylib.EndDrawing();
    end
end

Main()