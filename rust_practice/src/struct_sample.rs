// We have declared the mod in main.rs by mod struct_sample;
// So we don't need the mod struct_sample{} in this file.
// Notice that If we do that, the namespace will not be struct_sample but struct_sample::struct_sample.
pub fn run_sample() {
    // Create a instance of user struct.We use mut that we want to modify the struct after.
    let mut user1 = User {
        username: String::from("Kinryu.cho"),
        email: String::from("kinryu.cho@nsij.org"),
        sign_in_count: 1,
        active: true,
    };
    // Get the struct element and print it.
    println!("The mail address is {}", user1.email);
    // Modify a element of the struct.
    user1.email = String::from("example@site.org");
    println!("The new mail address is {}", user1.email);

    // Use the generator to declare a new User.
    let mut user2 = build_user(String::from("New User"), String::from("new_address@site.org"));
    // Print the hole struct.
    // See the two print, and find which is difference.
    println!("The user2 is {:?}", user2);
    println!("The user2 is {:#?}", user2);
}

// Declare a new struct
// Make the struct can be print out by println!({:?})
// Notice that #[derive(Debug)] is a annotation.
#[derive(Debug)]
struct User {
    username: String,
    email: String,
    sign_in_count: u64,
    active: bool,
}

// Declear a generator of struct
fn build_user(username: String, email: String) -> User {
    // User {
    //    username: username,
    //    email: email,
    //    sign_in_count: 1,
    //    active: true,
    // }
    // See the comment outted soure before, rust had shorthand for this like below.
    // If the variable name for value is same to key, only user one in them.
    User {
        username,
        email,
        sign_in_count: 1,
        active: true
    }
}
