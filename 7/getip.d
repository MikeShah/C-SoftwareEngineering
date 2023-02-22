// @file getip.d
import std.stdio;
import std.socket;

void main(){

	foreach(addr ; getAddress(Socket.hostName)){
		writeln(addr.toAddrString());
		writeln(typeid(addr));
	}

	

//	InternetHost ih = new InternetHost;
	
//	ih.getHostByName
//	writeln(ih.name.dup);

}
