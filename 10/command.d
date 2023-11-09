// command.d
import std.stdio;
import std.concurrency;
import core.thread;

interface Command{
    void Execute();
    void Undo();
}

class MoveCommand : Command{
    int x;
    int y;

    int previousX;
    int previousY;

    this(int x, int y){
        this.x = x;
        this.y = y;
    }

    void Move(int x, int y){
        this.x = x;
        this.y = y;
    }

    void Execute(){
        writeln("Moving at location: ", x,":", y);
    }

    void Undo(){
        x = previousX;
        y = previousY;
    }

}


void client(){
    int demo_iterations=2;
    while(demo_iterations>0){
        auto m = new MoveCommand(7,3);

        ownerTid.send(thisTid,cast(shared)m); // Send message to our owner


        Thread.sleep( dur!("seconds")( 3 ) );
        demo_iterations--;          // Decrement our lifetime
    }
}

void server(){
    // Let's assume there are 4 clients
    // We will store their thread ids here so that
    // we can uniquely identify them.
    Tid[] clients;

    for(int i=0; i < 4; ++i){
        // We spawn each of our 4 clients
        spawn(&client);
    } 
    // Now our server runs forever, and receives messages
    // from our clients.
    Command[] commands;

    while(commands.length < 8){
        // Note: 'receive' can take in more message types
        // Note: I need the 'alias' here because I have a 'shared MoveCommand'
        //       -- i.e. the data is not thread-local here, but shared.
        alias typ = shared MoveCommand;
        auto message = receiveOnly!(Tid,typ);

        // Write out which thread we receive data from
        writeln("Receiving command from:", message[0]);
        // Append the command
        writeln(typeid(message[1]));

        // Cast and treat the data as a regular 'command'
        // This is needed to get rid of the 'shared' state. 
        commands ~= cast(Command)message[1];

        // Just for debug output, write out the command length
        writeln("commands.length:",commands.length);
    }

    // Okay, a bunch of commands are in my queue.
    writeln("Okay, lots of commands in my queue");
    writeln("Will execute them all now");
    Thread.sleep( dur!("seconds")( 3 ) );


    foreach(c ; commands){
        c.Execute();
    }
}

void main(){
    // Call our server function
    server();   
}
