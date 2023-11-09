// Singleton.d
class Singleton{

    int someValue;

    // 'static' means one instance that is shared
    // 'shared' means among all threads this instance is shared
    private __gshared Singleton _instance;

    static Singleton instance(){
        if(_instance is null){
            _instance = new Singleton;
        }
        return _instance;
    }

  
    // Hide constructor from outside world
    private this(){};
}
