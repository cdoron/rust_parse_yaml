fn main() {
    let s = std::fs::read_to_string("sample.yaml").unwrap();
    let data: serde_yaml::Value = serde_yaml::from_str(&s).unwrap();

    // print entire mapping
    let m = data.as_mapping().unwrap();
    let s = serde_yaml::to_string(&m).unwrap();
    println!("The result: {:}", s);

    // extract single value from sample.yaml
    println!("qqq is mapped to: {}", data["auth"]["basic"]["credentials"]["qqq"].as_str().unwrap());

    let check = data["not-here"].as_str();
    println!("Is there a not-here value? - {:?}", check);
}
