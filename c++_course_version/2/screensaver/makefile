########################################################################################
# A sample makefile                                                                    #
# Type: 'make makefile' to run                                                         #
#       (Or you can simply type 'make' and if a file called 'makefile' is found in the #
#        current directory it will be executed with the first build rule.)             # 
########################################################################################
CC=g++                  # The compiler that we will use
CFLAGS=-std=c++17       # Any flags to the compiler
LIBS=-lsfml-graphics -lsfml-window -lsfml-system # Libraries we want to link in
                                                 # We may want to distinguish between
                                                 # 'static' and 'dynamic' libraries
INCLUDE=-I./include/                             # Include directory where header files
                                                 # are located. For now, we will look
                                                 # inside the current directory only.
BINARY=./bin/App 		# Output directory where our binary will be placed


# Our first 'build rule'. We can have as many as we like.
App: 
	$(CC) $(CFLAGS) ./src/*.cpp $(INCLUDE) -o $(BINARY) $(LIBS)

# For now a very simple 'clean' rule that will remove the 'App' that
# we have created. In practice, we can remove any other automatically
# generated files, such as ".o" files.
clean:
	rm $(BINARY)
