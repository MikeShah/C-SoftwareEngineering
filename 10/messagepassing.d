// messagepassing.d
import std.stdio;
import std.concurrency;
import core.thread;

void client(){
    int demo_iterations=100;
    while(demo_iterations>0){
        ownerTid.send(thisTid,"message"); // Send message to our owner
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
    while(true){
        // Note: 'receive' can take in more message types
        auto message = receiveOnly!(Tid,string);
        writeln("From:", message[0]," -- says ",message[1]);
    }
}

void main(){
    // Call our server function
    server();   
}
