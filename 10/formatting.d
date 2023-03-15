void main(string[] args) {
    bool optionOne, optionTwo, optionThree;

    // dfmt has no way of knowing that 
    // "getopt" is special, so it wraps the
    // argument list normally
    getopt(args, "optionOne", &optionOne, "optionTwo", &optionTwo, "optionThree", &optionThree);

    // dfmt off
    getopt(args,
        "optionOne", &optionOne,
        "optionTwo", &optionTwo,
        "optionThree", &optionThree);
    // dfmt on
}
