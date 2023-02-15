// @file //isPalindromeBadExample.d
import std.stdio;

bool isPalindromeBadExample(string input){
    // Yikes, with white-box testing we find out
    // that our function is not so resilient or
    // rather, just implemented plain wrong for
    // almost any input!
    if( input == "dad" ){
        return true;
    }
    if( input == "abc" ){
        return false;
    }
    
   return true;
}


void main(){
    writeln("dad?", isPalindromeBadExample("dad"));
    writeln("abc?", isPalindromeBadExample("abc"));
    writeln("123?", isPalindromeBadExample("123")); // WRONG

}
