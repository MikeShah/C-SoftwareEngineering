// dub run dfmt -- --inplace --space_after_cast=false --max_line_length=80 --soft_max_line_length=70 --brace_style=otbs formatting.d
void main(string[] args) {
    bool optionOne, optionTwo, optionThree;

    // dfmt has no way of knowing that 
    // "getopt" is special, so it wraps the
    // argument list normally
    getopt(args, "optionOne", &optionOne, "optionTwo", &optionTwo,
            "optionThree", &optionThree);

    // dfmt off
    getopt(args,
        "optionOne", &optionOne,
        "optionTwo", &optionTwo,
        "optionThree", &optionThree);
    // dfmt on
}
