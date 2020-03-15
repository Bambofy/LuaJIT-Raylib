ffi = require("ffi")
raylib = require("raylib")


function Main()
    print("Loading raylib...")

    raylib.InitWindow(800, 600, "test")

    raylib.SetTargetFPS(60);

    raylib.GuiEnable();

    while not raylib.WindowShouldClose() do
        raylib.BeginDrawing();

            raylib.ClearBackground(RAYWHITE)
            
        raylib.EndDrawing();
    end
end

Main()