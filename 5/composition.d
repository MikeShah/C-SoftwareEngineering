// @ composition.d
import std.stdio;

class Student{
	string name;
	string[] CoursesTaken;

	this(string _name){
		name = _name;
	}

	void AddCourse(string course){
		CoursesTaken ~= course;
	}

}

void main(){

	Student mike = new Student("Mike");
	mike.AddCourse("Foundations of Software Engineering");
	mike.AddCourse("Computer Graphics");

	writeln(mike.CoursesTaken);

}

