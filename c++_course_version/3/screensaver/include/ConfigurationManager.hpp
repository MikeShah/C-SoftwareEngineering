#ifndef CONFIGURATION_MANAGER_H
#define CONFIGURATION_MANAGER_H

class ConfigurationManager{
    public:
        static ConfigurationManager& instance(){
            static ConfigurationManager* instance = new ConfigurationManager();
            return *instance;
        }
        // Getter functions 
        int getWindowWidth();
        int getWindowHeight();
        // Setter functions
        void setWindowWidth(int w);
        void setWindowHeight(int h);
    private:
        // Hidden Constructor
        ConfigurationManager();
        ~ConfigurationManager();
        // Member variables
        int m_windowWidth;
        int m_windowHeight;
};
#endif




