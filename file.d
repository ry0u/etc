import std.stdio;
import std.file;
import std.process;
import std.string;
import std.conv;
import std.array;

int main() {

    auto f = File("in.txt","r");
    auto f2 = File("image.dot","w");

    f2.writeln("digraph g{");
    f2.writeln("node[shape = circle];");
    f2.writeln("rankdir=LR;");
    f2.writeln("nodestep=0.6;");

    string s = f.readln().chomp();
    int n = to!int(s[0]-'0');
    int m = to!int(s[2]-'0');
    foreach(i;0..m) {
        s = f.readln().chomp();
        string[] _s = s.split(" ");
        f2.writeln(_s[0]," -> ",_s[1]," [len = 3.0];");
    }

    f2.writeln("}");
    
    return 0;
}
