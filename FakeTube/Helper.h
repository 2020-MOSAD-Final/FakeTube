#ifndef Helper_h
#define Helper_h

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

float GetCenterLeft(float width, float height){
    return SCREEN_WIDTH*0.5 - width*0.5;
}

float GetCenterTop(float width, float height){
    return SCREEN_HEIGHT*0.5 - height*0.5;
}

#endif /* Helper_h */
