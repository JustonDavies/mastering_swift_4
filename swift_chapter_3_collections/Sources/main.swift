//-- Declaring Arrays ----------

let immutable_array = [1,2,3]
var mutable_array   = [4,5,6]

var idiomatic_typed_array   = [Int]()
var typed_array : [Int] = []

var string_array = [String]()
var double_array = [Double]()
//var object_array = [MyObject]()

var any_array : [Any] = [1, "two"]
var any_array_optional = [Any]()

var seeded_array = [String](repeating: "seed", count: 7)
print("Seeded array \(seeded_array)")

var two_d_array = [[1,2], [3,4]]
var optional_two_d_array = [[Int]]()

//-- Accessing Arrays ----------
let access_array = [1,2,3,4,5,6]
print(access_array[0])  //Displays '1'
print(access_array[3])  //Displays '4'

let multi_access_array = [[1,2],[3,4],[5,6]]
let inner_array          = multi_access_array[0]    //contains the array [1,2]
let value              = multi_access_array[0][1] //contains 2

let first = access_array.first  //first contains 1
let last = access_array.last    //last contains 6

let multi_first     = multi_access_array[0].first //contains 1
let multi_sub_first = multi_access_array.first    //contains[1,2]

//-- Counting Array Elements ----------
let counting_array       = [1,2,3]
let multi_counting_array = [[3,4],[5,6],[7,8]]
print(counting_array.count)           //Displays 3
print(multi_counting_array.count)     //Displays 3 for the three arrays
print(multi_counting_array[0].count)  //Displays 2 for the two elements

//This example will throw an array index out of range error
//let out_of_range = [1,2,3,4]
//print(out_of_range[6])

//This example will not throw an array index out of range error
let out_of_range = [1,2,3,4]
if (out_of_range.count > 6) {
  print(out_of_range[6])
}

//-- Array Is Empty ----------
var non_empty_array = [1,2]
var empty_array     = [Int]()

non_empty_array.isEmpty  //Returns false because the array is not empty
empty_array.isEmpty      //Returns true because the array is empty

//-- Appending to Array ----------
var append_array = [1,2]
append_array.append(3)    //will now contain 1, 2, 3
append_array += [4,5]     //will now contains 1, 2, 3, 4, 5

//-- Inserting in Array ----------
var insert_array = [1,2,3,4,5]
insert_array.insert(10, at: 3) //no contains 1,2,3,10,4,5
//NOTE: Can insert on last position (6) and that works, but its idiomatically risky

//-- Replacing in Array ----------
var replace_array = [1,2,3]
replace_array[1] = 10

//-- Removing from Array ----------
var remove_array = [1,2,3,4,5]
var removed_element       = remove_array.removeLast()    //now contains 1, 2, 3 and 4    ALSO: Returns value that was removed
var other_removed_element = remove_array.remove(at: 2)   //now contains 1, 2 and 4       ALSO: Returns value that was removed
remove_array.removeAll()     //is now empty

//-- Merging Arrays ----------
var pending_merge_array_0 = [1,2]
var pending_merge_array_1 = [1,2]

var merged_array = pending_merge_array_0 + pending_merge_array_1

//-- Sub-Arrays from Arrays ----------
let super_array = [1,2,3,4,5]
var sub_array_0 = super_array[2...4] //contains 3, 4 and 5; ... is the two-sided range operator, range including both ends
var sub_array_1 = super_array[2..<4] //contains 3 and 4   ; ..< half-open range operator, exclude last element
var sub_array_2 = super_array[..<3]  //contains 1, 2 and 3
var sub_array_3 = super_array[...3]  //contains 1, 2, 3 and 4
var sub_array_4 = super_array[2...]  //contains 3, 4 and 5

//-- Making Bulk Changes to Arrays ----------
var bulk_change_array_0 = [1,2,3,4,5]
bulk_change_array_0[1...2] = [12,13]  //contains 1,12,13,4 and 5

var bulk_change_array_1 = [1,2,3,4,5]
bulk_change_array_1[1...3] = [12,13] //now contains 1, 12, 13 and 5; NOTE: Length of operations does NOT need to match range

var bulk_change_array_2 = [1,2,3,4,5]
bulk_change_array_2[1...3] = [12,13,14,15]  //now contains 1, 12, 13, 14, 15 and 5

//-- Algorithms for Arrays ----------
var sort_array = [9,3,6,2,8,5]
sort_array.sort(){ $0 < $1 }   //contains 2,3,5,6,8 and 9
sort_array.sort(){ $0 > $1 }   //contains 9,8,6,5,3 and 2

var unsorted_array = [9,3,6,2,8,5]
var sorted_array = unsorted_array.sorted(){ $0 < $1 } //Does NOT replace original array

var filter_array =  [1,2,3,4,5,6,7,8,9]
let filtered_array = filter_array.filter{$0 > 3 && $0 < 7} //contains 4,5 and 6

var filter_city_array   = ["Boston", "London", "Chicago", "Atlanta"]
let filtered_city_array = filter_city_array.filter{$0.index(of:"o") != nil}  //contains "Boston", "London" and "Chicago", strings who had a range value for "o";

var map_array = [10, 20, 30, 40]
let mapped_array = map_array.map{ $0 / 10} //contains 1,2,3 and 4
let mapped_type_array = map_array.map{ "num:\($0)"} //contains  "num:1", "num:2", "num:3" and "num:4", types can change but must be uniform
//array.map{ ($0%2 == 0 ? $0 : "num:\($0)") }  //no way to make this Any as far as I can tell

var for_array = [10, 20, 30, 40]
for_array.forEach{ print($0) }          //NOT idiomatic, use for-in instead

for item in for_array {
  print(item)
}

//executing with index
for (index,value) in for_array.enumerated() {
  print("\(index) \(value)")
}

//-- Dictionaries ----------

var country_dictionary = ["US":"UnitedStates","IN":"India","UK":"UnitedKingdom"]
print("Country code US: \(country_dictionary["US"])")
print("Country code XY: \(country_dictionary["XY"])")

var dic1 = [String:String]()
var dic2 = [Int:String]()
//var dic3 = [String:MyObject]() //NOTE: MyObject must conform to Hashable protocol
var dic4: [String:String] = [:]
var dic5: [Int:String] = [:]

//Counting elements
print(country_dictionary.count)

//isEmpty
print(country_dictionary.isEmpty )

//Updating Key
country_dictionary["UK"] = "Great Britain"

var original_value = country_dictionary.updateValue("Britain", forKey: "UK") //contains "Great Britain"

//Adding Key/value
country_dictionary["FR"] = "France"

var new_assign_value = country_dictionary.updateValue("Germany", forKey: "DE") //contains nil since it is a new value

//Removing Key/Value
country_dictionary["IN"] = nil  //The Key/Value is COMPLETELY removed
var removed_value = country_dictionary.removeValue(forKey:"UK")     //contains "United Kingdom"

country_dictionary.removeAll()

//-- Sets ----------
//NOTE: Items must conform to Hashable Protocol
var empty_string_set = Set<String>()
var string_set = Set(["one", "two", "three"])

//Inserting Items
print("Adding one: \(string_set.insert("one"))")   //insert returns tuple
print("Adding four: \(string_set.insert("four"))")

//Counting
print("\(string_set.count) items")

//Check for a specific item
var contains_item = string_set.contains("two")
print("Contains two: \(contains_item)")

//Iterating over a set
for item in string_set {
  print(item)
}

//Removing items
print("Removing two: \(string_set.remove("two"))") //returns item, not touple
print("Removing thingme: \(string_set.remove("thingme"))")

//The removeAll method will remove all items from a set
string_set.removeAll()

//Set Operations
var operation_set_0 = Set(["One", "Two", "Three", "abc"])
var operation_set_1 = Set(["abc","def","ghi", "One"])

var new_union_set = operation_set_0.union(operation_set_1)  //contains  "One", "Two", "Three", "abc","def","ghi"
//operation_set_0.formUnion(operation_set_1) //Does union overwritting operation_set_0

var new_subtracting_set = operation_set_0.subtracting(operation_set_1)   //contains "Two", "Three"
//operation_set_0.subtract(operation_set_1)  //Does union overwritting operation_set_0

var new_intersection_set = operation_set_0.intersection(operation_set_1)  //contains "One", "abc"
//operation_set_0.formIntersection(operation_set_1)  //Does union intersection operation_set_0

var new_difference_set = operation_set_0.symmetricDifference(operation_set_1) //contains "Two", "Three", "def", "ghi"
//operation_set_0.formSymmetricDifference(operation_set_1)  //Does union difference operation_set_0

//-- Tuples ----------
var tuple_team = ("Boston", "Red Sox", 97, 65, 59.9)

//Unpacking
var (unpacked_city, unpacked_name, unpacked_wins, unpacked_loses, unpacked_percent) = tuple_team

var unpacked_position_city    = tuple_team.0
var unpacked_position_name    = tuple_team.1
var unpacked_position_wins    = tuple_team.2
var unpacked_position_loses   = tuple_team.3
var unpacked_position_percent = tuple_team.4

//Named Values
var named_tuple_team = (city:"Boston", name:"Red Sox", wins:97, loses:65, percent:59.9)

var unpacked_named_city    = named_tuple_team.city
var unpacked_named_name    = named_tuple_team.name
var unpacked_named_wins    = named_tuple_team.wins
var unpacked_named_loses   = named_tuple_team.loses
var unpacked_named_percent = named_tuple_team.percent