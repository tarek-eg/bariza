import Debug "mo:base/Debug";
actor {
  public func location(city : Text) : async Text {
      Debug.print(city # " Location was called \n");
    return "Hello, " # city # "!";
  };
};