//-- Constants ----------
let freezingTemperatureOfWaterCelsius = 0
let speedOfLightKmSec = 300_000

// Variables ----------
var currentTemperature = 22
var currentSpeed = 55

//-- Multiple Declarations ----------
let part_0 = "Multiple declarations", part_2 = "code"
var part_1 = "shorten"

part_1 = "uglify"

//-- Type inference ----------
var inferred_double  = 3.14     // Double type
var inferred_string  = "Hello"  // String type
var inferred_boolean = true     // Boolean type

//-- Explicit Types ----------
var explicit_float: Float = 3.14

//-- Unspecified Declarations ----------
var unspecified_integer: Int

//-- Integer Types ----------

  //Int<bits>  (defaults to 64 bits when not specified)
  //UInt<bits> (defaults to 64 bits when not specified)

  //Types are structures, so you can execute some methods on them
  print("Int range \(Int.min) to \(Int.max)")

  //Integers can also be represented in Binary(0b) Octal(0o) and Hexidecimal(0x) with a prefix
  var decimal = 95, binary = 0b1011111, octal = 0o137, hexadecimal = 0x5f
  print("decimal:     \(decimal) \n"   +
          "binary:      \(binary) \n" +
          "octal:       \(octal) \n"   +
          "hexadecimal: \(hexadecimal)")


//-- Float Types ----------

  //Float (32 bit floating point number), Double (64 bit floating point) and Float80 (80 bit floating point number)
  //Recommended to always just use Double, 15 digit decimal precision

  let float: Float = 0.111_111_111 + 0.222_222_222       //0.333_333
  let double: Double = 0.111_111_111 + 0.222_222_222     //0.333_333_333

  print("float: \(float)\n" +
      "double: \(double)")



//-- Type coercion - It doesnt ----------
  var coercion_integer: Int = 3
  var coercion_double: Double = 0.14
  var coercion_product = Double(coercion_integer) + coercion_double

  print("coercion_product: \(coercion_product)")

  var coercion_float = Float(coercion_integer)
  var coercion_uint16 = UInt16(coercion_integer)

  print("coercion_float: \(coercion_float)\n" +
      "coercion_uint16: \(coercion_uint16)")

//-- Boolean Types ----------

  let swift_is_cool = true
  var it_is_raining = false

  if swift_is_cool {
    print("YEA, I cannot wait to learn it")
  }
  if it_is_raining {
    print("Get a rain coat")
  }


//-- String Types ----------
  var string_hello = "Hello"
  var string_world = " World"
  var string_multi_line = """
  This is a multi-line string literal. This shows how we can create a string over multiple lines. 
  """

  for _character in string_hello.characters {
    print(_character)
  }

  string_world.map {
    print($0)
  }

  //Concating
  var concating_hello_world_0 = ""
  var concating_hello_world_1: String

  concating_hello_world_0 += string_hello
  concating_hello_world_0 += string_world
  concating_hello_world_1 = string_hello + string_world

  //Interpolation
  var interpolation_me = "me"
  var interpolation_thing_me = "thing \(interpolation_me)"

  //Immutability
  let immutable_name = "Juston"

  //Transforms
  var transform_hello = "hElLo"
  print("Lowercase String:  " + transform_hello.lowercased())
  print("Uppercase String:  " + transform_hello.uppercased())

  //Equality
  var equality_0 = "Thingme"
  var equality_1 = ""

  equality_0.isEmpty  //false
  equality_1.isEmpty  //true

  equality_0 == "thingme" //false
  equality_0 == "Thingme" //true

  //NOTE: Swift 4.0.2 seems to be missing some members from the string interface: hasPrefix, hasSuffix, replacingOccurrences and substring are missing
  //equality_0.hasPrefix("Thing") //true
  //equality_0.hasSuffix("Thing") //false

  //Replace and substring
  var replace_string = "one,to,three,four"
  //print(replace_string.replacingOccurrences(of: "to", with: "two"))

  var string_path = "/one/two/three/four"

  //Create start and end indexes
  let start_index = string_path.index(string_path.startIndex, offsetBy: 4)
  let end_index   = string_path.index(string_path.startIndex, offsetBy: 14)

  let substring_path = string_path[start_index ..< end_index] //returns the "/two/three"

  //convert the substring to a string
  let string_sub_path = String(substring_path)

  //string_path.substring(to: startIndex)  //returns the "/one"
  //string_path.substring(from: endIndex)  //returns the "/four"

  String(string_path[..<start_index])  //returns the "/one" with the ..(upto)<(excluding)
  String(string_path[end_index...])  //returns the "/four"

  string_path.last
  string_path.first

  //SubString Indexes strike me a lot like customer iterators

//-- Optionals ----------
  var optional_string : String?

  //"Unwrapping"
  if optional_string != nil {
    print("Optional has a non-nil value of: \(optional_string)")
  }

  //Binding - created a temporary non-optional to use
  if let _temp = optional_string {
    print("Optional has been bound to a non-optional value of: \(_temp)")
    print("Cannot use the newly created non-optional outside of the if bracket!")
  } else {
    print("The optional value had a nil value")
  }

  //Binding - Done more idiomatically
  var myOptional: String?
  myOptional = "Jon"
  if var myOptional = myOptional {
    myOptional = "test"
    print("Inside:  \(myOptional)")
  }
  print("Outside: \(myOptional)") //prints Jon

  //Multiple binding

  //if let myOptional = myOptional, let myOptional2 = myOptional2, let myOptional3 = myOptional3 {
    // only reach this if all three optionals
    // have non-nil values
  //}


  //Optional Chaining
  //var tireSize = car?.tires?.tireSize If any one of the x? items is nil the whole expression returns nil

//-- Enumerations ---------
  enum Planets {
    case Mercury
    case Venus
    case Earth
    case Mars
    case Jupiter
    case Saturn
    case Uranus
    case Neptune
  }

  //Same thing
  //enum Planets {
  //  case Mercury, Venus, Earth, Mars, Jupiter
  //  case Saturn, Uranus, Neptune
  //}


  var planetWeLiveOn = Planets.Earth
  planetWeLiveOn = .Mars                   //Able to do this after type inference
  var furthestPlanet = Planets.Neptune

  //Comparison
  // Using the traditional == operator  
  if planetWeLiveOn == .Earth {
    print("Earth it is")
  }

  // Using the switch statement
  switch planetWeLiveOn {
  case .Mercury:
    print("We live on Mercury, it is very hot!")
  case .Venus:
    print("We live on Venus, it is very hot!")
  case .Earth:
    print("We live on Earth, just right")
  case .Mars:
    print("We live on Mars, a little cold")
  default:
    print("Where do we live?")
  }

  //Raw values
  enum Devices: String {
    case MusicPlayer = "iPod"
    case Phone = "iPhone"
    case Tablet = "iPad"
  }

  print("We are using an \(Devices.Tablet.rawValue)")

  //Auto-incrementing values
  enum IncrementingPlanets: Int {
    case Mercury = 1
    case Venus
    case Earth
    case Mars
    case Jupiter
    case Saturn
    case Uranus
    case Neptune
  }
  print("Earth is planet number \(IncrementingPlanets.Earth.rawValue)")


  //Associated Values - Enum plus struct-ish
  enum Product {
    case Book(Double, Int, Int)
    case Puzzle(Double, Int)
  }

  var mastering_swift = Product.Book(49.99, 2017, 310)
  var random_puzzle = Product.Puzzle(9.99, 200)

  switch mastering_swift {
  case .Book(let price, let year, let pages):
    print("Mastering Swift was published in \(year) for the price of \(price) and has \(pages) pages")
  case .Puzzle(let price, let pieces):
    print("Mastering Swift is a puzzle with \(pieces) and sells for \(price)")
  } //"Master Swift was published in 2017 for the price of 49.99 and has 310 pages" 