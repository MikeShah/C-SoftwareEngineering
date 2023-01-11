// ConfigurationManager.cpp
#include "ConfigurationManager.hpp"

ConfigurationManager::ConfigurationManager(){ 
}
ConfigurationManager::~ConfigurationManager(){
}

// Return width
int ConfigurationManager::getWindowWidth(){
    return m_windowWidth;
}
// Return height
int ConfigurationManager::getWindowHeight(){
    return m_windowHeight;
}
// Set width
void ConfigurationManager::setWindowWidth(int w){
    m_windowWidth = w;
}
// set height
void ConfigurationManager::setWindowHeight(int h){
    m_windowHeight = h;
}
