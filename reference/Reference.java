package example;

public class Reference {
    public static String name() {
        return "reference, changed! => " + Target.name();
    }
}