// @file Packet.d


// NOTE: Consider the endianness of the target machine when you 
//       send packets. If you are sending packets to different
//       operating systems with different hardware, the
//       bytes may be flipped!
//       A test you can do is to when you send a packet to a
//       operating system is send a 'known' value to the operating system
//       i.e. some number. If that number is expected (e.g. 12345678), then
//       the byte order need not be flipped.
struct Packet{
    char[64] message; // for debugging
    uint x;
    uint y;
    ubyte r;
    ubyte g;
    ubyte b;

    char[Packet.sizeof] GetPacket(){
        message = "message";
        char[Packet.sizeof] payload;
        return payload;
    }
}
