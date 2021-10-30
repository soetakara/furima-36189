# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<!-- テーブル設計 -->

<!-- usersテーブル -->
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | text   | null: false               |
| first_name         | text   | null: false               |
| last_name_kana     | text   | null: false               |
| first_name_kana    | text   | null: false               |
| birthday           | string | null: false               |