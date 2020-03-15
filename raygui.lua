local ffi = require("ffi")
local raygui = ffi.load("lib/osx/libraygui.dylib")

local ENABLE_RICONS = true
local ENABLE_TEXTBOX_EXTENDED = true

--[[
    Raygui version 2.6
]]

--[[
    Structures
]]
ffi.cdef([[
    typedef struct GuiStyleProp {
        unsigned short controlId;
        unsigned short propertyId;
        int propertyValue;
    } GuiStyleProp;
    
    
    typedef enum {
        GUI_STATE_NORMAL = 0,
        GUI_STATE_FOCUSED,
        GUI_STATE_PRESSED,
        GUI_STATE_DISABLED,
    } GuiControlState;
    
    
    typedef enum {
        GUI_TEXT_ALIGN_LEFT = 0,
        GUI_TEXT_ALIGN_CENTER,
        GUI_TEXT_ALIGN_RIGHT,
    } GuiTextAlignment;
    
    
    typedef enum {
        DEFAULT = 0,
        LABEL,          
        BUTTON,         
        TOGGLE,         
        SLIDER,         
        PROGRESSBAR,
        CHECKBOX,
        COMBOBOX,
        DROPDOWNBOX,
        TEXTBOX,        
        VALUEBOX,
        SPINNER,
        LISTVIEW,
        COLORPICKER,
        SCROLLBAR,
        STATUSBAR
    } GuiControl;
    
    
    typedef enum {
        BORDER_COLOR_NORMAL = 0,
        BASE_COLOR_NORMAL,
        TEXT_COLOR_NORMAL,
        BORDER_COLOR_FOCUSED,
        BASE_COLOR_FOCUSED,
        TEXT_COLOR_FOCUSED,
        BORDER_COLOR_PRESSED,
        BASE_COLOR_PRESSED,
        TEXT_COLOR_PRESSED,
        BORDER_COLOR_DISABLED,
        BASE_COLOR_DISABLED,
        TEXT_COLOR_DISABLED,
        BORDER_WIDTH,
        TEXT_PADDING,
        TEXT_ALIGNMENT,
        RESERVED
    } GuiControlProperty;
    
    
    
    
    
    typedef enum {
        TEXT_SIZE = 16,
        TEXT_SPACING,
        LINE_COLOR,
        BACKGROUND_COLOR,
    } GuiDefaultProperty;
    
    
    
    
    
    
    
    
    typedef enum {
        GROUP_PADDING = 16,
    } GuiToggleProperty;
    
    
    typedef enum {
        SLIDER_WIDTH = 16,
        SLIDER_PADDING
    } GuiSliderProperty;
    
    
    typedef enum {
        PROGRESS_PADDING = 16,
    } GuiProgressBarProperty;
    
    
    typedef enum {
        CHECK_PADDING = 16
    } GuiCheckBoxProperty;
    
    
    typedef enum {
        COMBO_BUTTON_WIDTH = 16,
        COMBO_BUTTON_PADDING
    } GuiComboBoxProperty;
    
    
    typedef enum {
        ARROW_PADDING = 16,
        DROPDOWN_ITEMS_PADDING
    } GuiDropdownBoxProperty;
    
    
    typedef enum {
        TEXT_INNER_PADDING = 16,
        TEXT_LINES_PADDING,
        COLOR_SELECTED_FG,
        COLOR_SELECTED_BG
    } GuiTextBoxProperty;
    
    
    typedef enum {
        SPIN_BUTTON_WIDTH = 16,
        SPIN_BUTTON_PADDING,
    } GuiSpinnerProperty;
    
    
    typedef enum {
        ARROWS_SIZE = 16,
        ARROWS_VISIBLE,
        SCROLL_SLIDER_PADDING,
        SCROLL_SLIDER_SIZE,
        SCROLL_PADDING,
        SCROLL_SPEED,
    } GuiScrollBarProperty;
    
    
    typedef enum {
        SCROLLBAR_LEFT_SIDE = 0,
        SCROLLBAR_RIGHT_SIDE
    } GuiScrollBarSide;
    
    
    typedef enum {
        LIST_ITEMS_HEIGHT = 16,
        LIST_ITEMS_PADDING,
        SCROLLBAR_WIDTH,
        SCROLLBAR_SIDE,
    } GuiListViewProperty;
    
    
    typedef enum {
        COLOR_SELECTOR_SIZE = 16,
        HUEBAR_WIDTH,                  
        HUEBAR_PADDING,                
        HUEBAR_SELECTOR_HEIGHT,        
        HUEBAR_SELECTOR_OVERFLOW       
    } GuiColorPickerProperty;
]])

--[[
    raygui methods
]]
ffi.cdef([[

    extern void GuiEnable(void);                                         
    extern void GuiDisable(void);                                        
    extern void GuiLock(void);                                           
    extern void GuiUnlock(void);                                         
    extern void GuiFade(float alpha);                                    
    extern void GuiSetState(int state);                                  
    extern int GuiGetState(void);                                        
    
    
    extern void GuiSetFont(Font font);                                   
    extern Font GuiGetFont(void);                                        
    
    
    extern void GuiSetStyle(int control, int property, int value);       
    extern int GuiGetStyle(int control, int property);                   
    
    
    extern void GuiEnableTooltip(void);                                  
    extern void GuiDisableTooltip(void);                                 
    extern void GuiSetTooltip(const char *tooltip);                      
    extern void GuiClearTooltip(void);                                   
    
    
    extern bool GuiWindowBox(Rectangle bounds, const char *title);                                       
    extern void GuiGroupBox(Rectangle bounds, const char *text);                                         
    extern void GuiLine(Rectangle bounds, const char *text);                                             
    extern void GuiPanel(Rectangle bounds);                                                              
    extern Rectangle GuiScrollPanel(Rectangle bounds, Rectangle content, Vector2 *scroll);               
    
    
    extern void GuiLabel(Rectangle bounds, const char *text);                                            
    extern bool GuiButton(Rectangle bounds, const char *text);                                           
    extern bool GuiLabelButton(Rectangle bounds, const char *text);                                      
    extern bool GuiImageButton(Rectangle bounds, const char *text, Texture2D texture);                   
    extern bool GuiImageButtonEx(Rectangle bounds, const char *text, Texture2D texture, Rectangle texSource);    
    extern bool GuiToggle(Rectangle bounds, const char *text, bool active);                              
    extern int GuiToggleGroup(Rectangle bounds, const char *text, int active);                           
    extern bool GuiCheckBox(Rectangle bounds, const char *text, bool checked);                           
    extern int GuiComboBox(Rectangle bounds, const char *text, int active);                              
    extern bool GuiDropdownBox(Rectangle bounds, const char *text, int *active, bool editMode);          
    extern bool GuiSpinner(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode);     
    extern bool GuiValueBox(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode);    
    extern bool GuiTextBox(Rectangle bounds, char *text, int textSize, bool editMode);                   
    extern bool GuiTextBoxMulti(Rectangle bounds, char *text, int textSize, bool editMode);              
    extern float GuiSlider(Rectangle bounds, const char *textLeft, const char *textRight, float value, float minValue, float maxValue);       
    extern float GuiSliderBar(Rectangle bounds, const char *textLeft, const char *textRight, float value, float minValue, float maxValue);    
    extern float GuiProgressBar(Rectangle bounds, const char *textLeft, const char *textRight, float value, float minValue, float maxValue);  
    extern void GuiStatusBar(Rectangle bounds, const char *text);                                        
    extern void GuiDummyRec(Rectangle bounds, const char *text);                                         
    extern int GuiScrollBar(Rectangle bounds, int value, int minValue, int maxValue);                    
    extern Vector2 GuiGrid(Rectangle bounds, float spacing, int subdivs);                                
    
    
    extern int GuiListView(Rectangle bounds, const char *text, int *scrollIndex, int active);            
    extern int GuiListViewEx(Rectangle bounds, const char **text, int count, int *focus, int *scrollIndex, int active);      
    extern int GuiMessageBox(Rectangle bounds, const char *title, const char *message, const char *buttons);                 
    extern int GuiTextInputBox(Rectangle bounds, const char *title, const char *message, const char *buttons, char *text);   
    extern Color GuiColorPicker(Rectangle bounds, Color color);                                          
    extern Color GuiColorPanel(Rectangle bounds, Color color);                                           
    extern float GuiColorBarAlpha(Rectangle bounds, float alpha);                                        
    extern float GuiColorBarHue(Rectangle bounds, float value);                                          
    
    
    extern void GuiLoadStyle(const char *fileName);              
    extern void GuiLoadStyleDefault(void);                       
    
    
    extern const char *GuiIconText(int iconId, const char *text); 
    
    extern void GuiDrawIcon(int iconId, Vector2 position, int pixelSize, Color color);
    extern unsigned int *GuiGetIcons(void);                      
    extern unsigned int *GuiGetIconData(int iconId);             
    extern void GuiSetIconData(int iconId, unsigned int *data);  
    
    extern void GuiSetIconPixel(int iconId, int x, int y);       
    extern void GuiClearIconPixel(int iconId, int x, int y);     
    extern bool GuiCheckIconPixel(int iconId, int x, int y);
]])

--[[
    ricons
]]
if (ENABLE_RICONS) then

ffi.cdef([[
    static const unsigned int RICONS_COUNT = 199; 
    static const unsigned int RICONS_SIZE = 16;    
    
    typedef enum {
        RICON_NONE = 0,
        RICON_FOLDER_FILE_OPEN,
        RICON_FILE_SAVE_CLASSIC,
        RICON_FOLDER_OPEN,
        RICON_FOLDER_SAVE,
        RICON_FILE_OPEN,
        RICON_FILE_SAVE,
        RICON_FILE_EXPORT,
        RICON_FILE_NEW,
        RICON_FILE_DELETE,
        RICON_FILETYPE_TEXT,
        RICON_FILETYPE_AUDIO,
        RICON_FILETYPE_IMAGE,
        RICON_FILETYPE_PLAY,
        RICON_FILETYPE_VIDEO,
        RICON_FILETYPE_INFO,
        RICON_FILE_COPY,
        RICON_FILE_CUT,
        RICON_FILE_PASTE,
        RICON_CURSOR_HAND,
        RICON_CURSOR_POINTER,
        RICON_CURSOR_CLASSIC,
        RICON_PENCIL,
        RICON_PENCIL_BIG,
        RICON_BRUSH_CLASSIC,
        RICON_BRUSH_PAINTER,
        RICON_WATER_DROP,
        RICON_COLOR_PICKER,
        RICON_RUBBER,
        RICON_COLOR_BUCKET,
        RICON_TEXT_T,
        RICON_TEXT_A,
        RICON_SCALE,
        RICON_RESIZE,
        RICON_FILTER_POINT,
        RICON_FILTER_BILINEAR,
        RICON_CROP,
        RICON_CROP_ALPHA,
        RICON_SQUARE_TOGGLE,
        RICON_SIMMETRY,
        RICON_SIMMETRY_HORIZONTAL,
        RICON_SIMMETRY_VERTICAL,
        RICON_LENS,
        RICON_LENS_BIG,
        RICON_EYE_ON,
        RICON_EYE_OFF,
        RICON_FILTER_TOP,
        RICON_FILTER,
        RICON_TARGET_POINT,
        RICON_TARGET_SMALL,
        RICON_TARGET_BIG,
        RICON_TARGET_MOVE,
        RICON_CURSOR_MOVE,
        RICON_CURSOR_SCALE,
        RICON_CURSOR_SCALE_RIGHT,
        RICON_CURSOR_SCALE_LEFT,
        RICON_UNDO,
        RICON_REDO,
        RICON_REREDO,
        RICON_MUTATE,
        RICON_ROTATE,
        RICON_REPEAT,
        RICON_SHUFFLE,
        RICON_EMPTYBOX,
        RICON_TARGET,
        RICON_TARGET_SMALL_FILL,
        RICON_TARGET_BIG_FILL,
        RICON_TARGET_MOVE_FILL,
        RICON_CURSOR_MOVE_FILL,
        RICON_CURSOR_SCALE_FILL,
        RICON_CURSOR_SCALE_RIGHT_FILL,
        RICON_CURSOR_SCALE_LEFT_FILL,
        RICON_UNDO_FILL,
        RICON_REDO_FILL,
        RICON_REREDO_FILL,
        RICON_MUTATE_FILL,
        RICON_ROTATE_FILL,
        RICON_REPEAT_FILL,
        RICON_SHUFFLE_FILL,
        RICON_EMPTYBOX_SMALL,
        RICON_BOX,
        RICON_BOX_TOP,
        RICON_BOX_TOP_RIGHT,
        RICON_BOX_RIGHT,
        RICON_BOX_BOTTOM_RIGHT,
        RICON_BOX_BOTTOM,
        RICON_BOX_BOTTOM_LEFT,
        RICON_BOX_LEFT,
        RICON_BOX_TOP_LEFT,
        RICON_BOX_CENTER,
        RICON_BOX_CIRCLE_MASK,
        RICON_POT,
        RICON_ALPHA_MULTIPLY,
        RICON_ALPHA_CLEAR,
        RICON_DITHERING,
        RICON_MIPMAPS,
        RICON_BOX_GRID,
        RICON_GRID,
        RICON_BOX_CORNERS_SMALL,
        RICON_BOX_CORNERS_BIG,
        RICON_FOUR_BOXES,
        RICON_GRID_FILL,
        RICON_BOX_MULTISIZE,
        RICON_ZOOM_SMALL,
        RICON_ZOOM_MEDIUM,
        RICON_ZOOM_BIG,
        RICON_ZOOM_ALL,
        RICON_ZOOM_CENTER,
        RICON_BOX_DOTS_SMALL,
        RICON_BOX_DOTS_BIG,
        RICON_BOX_CONCENTRIC,
        RICON_BOX_GRID_BIG,
        RICON_OK_TICK,
        RICON_CROSS,
        RICON_ARROW_LEFT,
        RICON_ARROW_RIGHT,
        RICON_ARROW_BOTTOM,
        RICON_ARROW_TOP,
        RICON_ARROW_LEFT_FILL,
        RICON_ARROW_RIGHT_FILL,
        RICON_ARROW_BOTTOM_FILL,
        RICON_ARROW_TOP_FILL,
        RICON_AUDIO,
        RICON_FX,
        RICON_WAVE,
        RICON_WAVE_SINUS,
        RICON_WAVE_SQUARE,
        RICON_WAVE_TRIANGULAR,
        RICON_CROSS_SMALL,
        RICON_PLAYER_PREVIOUS,
        RICON_PLAYER_PLAY_BACK,
        RICON_PLAYER_PLAY,
        RICON_PLAYER_PAUSE,
        RICON_PLAYER_STOP,
        RICON_PLAYER_NEXT,
        RICON_PLAYER_RECORD,
        RICON_MAGNET,
        RICON_LOCK_CLOSE,
        RICON_LOCK_OPEN,
        RICON_CLOCK,
        RICON_TOOLS,
        RICON_GEAR,
        RICON_GEAR_BIG,
        RICON_BIN,
        RICON_HAND_POINTER,
        RICON_LASER,
        RICON_COIN,
        RICON_EXPLOSION,
        RICON_1UP,
        RICON_PLAYER,
        RICON_PLAYER_JUMP,
        RICON_KEY,
        RICON_DEMON,
        RICON_TEXT_POPUP,
        RICON_GEAR_EX,
        RICON_CRACK,
        RICON_CRACK_POINTS,
        RICON_STAR,
        RICON_DOOR,
        RICON_EXIT,
        RICON_MODE_2D,
        RICON_MODE_3D,
        RICON_CUBE,
        RICON_CUBE_FACE_TOP,
        RICON_CUBE_FACE_LEFT,
        RICON_CUBE_FACE_FRONT,
        RICON_CUBE_FACE_BOTTOM,
        RICON_CUBE_FACE_RIGHT,
        RICON_CUBE_FACE_BACK,
        RICON_CAMERA,
        RICON_SPECIAL,
        RICON_LINK_NET,
        RICON_LINK_BOXES,
        RICON_LINK_MULTI,
        RICON_LINK,
        RICON_LINK_BROKE,
        RICON_TEXT_NOTES,
        RICON_NOTEBOOK,
        RICON_SUITCASE,
        RICON_SUITCASE_ZIP,
        RICON_MAILBOX,
        RICON_MONITOR,
        RICON_PRINTER,
        RICON_PHOTO_CAMERA,
        RICON_PHOTO_CAMERA_FLASH,
        RICON_HOUSE,
        RICON_HEART,
        RICON_CORNER,
        RICON_VERTICAL_BARS,
        RICON_VERTICAL_BARS_FILL,
        RICON_LIFE_BARS,
        RICON_INFO,
        RICON_CROSSLINE,
        RICON_HELP,
        RICON_FILETYPE_ALPHA,
        RICON_FILETYPE_HOME,
        RICON_LAYERS_VISIBLE,
        RICON_LAYERS,
        RICON_WINDOW
    } rIconDescription;
    
    void DrawIcon(int iconId, Vector2 position, int pixelSize, Color color);
]])
end

--[[
    textbox extended
]]
if ENABLE_TEXTBOX_EXTENDED then
ffi.cdef([[
    typedef struct GuiTextBoxState {
        int cursor;      // Cursor position in text
        int start;       // Text start position (from where we begin drawing the text)
        int index;       // Text start index (index inside the text of `start` always in sync)
        int select;      // Marks position of cursor when selection has started
    } GuiTextBoxState;
    
    extern void GuiTextBoxSetActive(Rectangle bounds);                   
    extern Rectangle GuiTextBoxGetActive(void);                          
    
    extern void GuiTextBoxSetCursor(int cursor);                         
    extern int GuiTextBoxGetCursor(void);                                
    
    extern void GuiTextBoxSetSelection(int start, int length);           
    extern Vector2 GuiTextBoxGetSelection(void);                         
    
    extern bool GuiTextBoxIsActive(Rectangle bounds);                    
    extern GuiTextBoxState GuiTextBoxGetState(void);                     
    extern void GuiTextBoxSetState(GuiTextBoxState state);               
    
    extern void GuiTextBoxSelectAll(const char *text);                   
    extern void GuiTextBoxCopy(const char *text);                        
    extern void GuiTextBoxPaste(char *text, int textSize);               
    extern void GuiTextBoxCut(char *text);                               
    extern int GuiTextBoxDelete(char *text, int length, bool before);    
    extern int GuiTextBoxGetByteIndex(const char *text, int start, int from, int to); 
    
    extern bool GuiTextBoxEx(Rectangle bounds, char *text, int textSize, bool editMode);
]])
end
return raygui