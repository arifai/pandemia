#![allow(unused_imports)]
extern crate chrono;

use chrono::Local;
use std::{env, fs, process};

fn main() {


    let output = process::Command::new("git")
        .arg("rev-parse")
        .arg("HEAD")
        .output()
        .expect("Cannot get git_rev");

    let git_rev = String::from_utf8_lossy(&output.stdout);
    let git_rev = git_rev.trim();

    println!("cargo:rustc-env=GIT_REV={}", git_rev);

    if env::var("BUILD_FOR") == Ok("nightly".to_string()) {
        println!(
            "cargo:rustc-env=BUILD_INFO=ngihtly build {} @ {}",
            env::var("TARGET").unwrap(),
            Local::now()
        );
    } else {
        println!(
            "cargo:rustc-env=BUILD_INFO={} build {} @ {}",
            env::var("PROFILE").unwrap(),
            env::var("TARGET").unwrap(),
            Local::now()
        );
    }
}

