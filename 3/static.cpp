#include <iostream>
class Game{
    public:
        static int points;
        static void addPoints(){
            points++;
            std::cout << "points " << points << std::endl;
        }

    Game(){
        addPoints();
    }

};

int Game::points = 70;

int main(){
    Game game1;
    Game game2;
    Game game3;
    Game game4;
    Game game5;
    std::cout << Game::points<< std::endl;
    return 0;
}



