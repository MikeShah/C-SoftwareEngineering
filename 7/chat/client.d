// @file chat/client.d
//
// After starting server (rdmd server.d)
// then start as many clients as you like with "rdmd client.d"
//
import std.socket;
import std.stdio;

// Entry point to client
void main(){
	writeln("Starting client...attempt to create socket");
    // Create a socket for connecting to a server
    auto socket = new Socket(AddressFamily.INET, SocketType.STREAM);
<<<<<<< HEAD
	// Socket needs an 'endpoint', so we determine where we
	// are going to connect to.
	// NOTE: It's possible the port number is in use if you are not
	//       able to connect. Try another one.
    socket.connect(new InternetAddress("localhost", 50001));
	scope(exit) socket.close();
	writeln("Connected");

    // Buffer of data to send out
	// Choose '1024' bytes of information to be sent/received
    char[1024] buffer;
=======
    // Connect to a server
    // Specific address and port must match
    socket.connect(new InternetAddress("localhost", 5000));

    // Buffer of data to send out
    char[Packet.sizeof] buffer;
>>>>>>> 8db2e763abf5f6ee670e2698c0637552c7ca5a82
    auto received = socket.receive(buffer);

    writeln("(Client connecting) ", buffer[0 .. received]);
	write(">");
    foreach(line; stdin.byLine){
		// Send the packet of information
        socket.send(line);
		// Now we'll immedietely block and await data from the server
		auto fromServer = buffer[0 .. socket.receive(buffer)];
        writeln("Server echos back: ", fromServer);
		write(">");
    }
}
