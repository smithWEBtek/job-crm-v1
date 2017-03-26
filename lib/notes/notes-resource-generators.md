notes-resource-generators.md


1. create resource generator command for all models

rails g resource Org name:string city:string state:string url:string about:text

rails g resource Contact org_id:integer fname:string  lname:string  title:string  email:string  phone:string  url:string  about:text history:text

rails g resource Action step_id:integer job_id:integer contact_id:integer org_id:integer due_date notes status next_step first_contact

rails g resource Step name:string category:string


rails g resource Job title:string  url:string org_id:integer description:text requirements:text instructions:text

rails g resource User name:string email:string phone:string address:string city:string state:string zip:string coach_name:string coach_email:string coach_phone:string

rails g resource Resource name:string format:string location:string user_id:integer description:text tags:string

rails g resource Tag name:string category:string

rails g model Pdf file_name:string location:string

rails g model Scrape file_name:string location:string

rails g model Doc file_name:string location:string

------------------------------

2.complete all AR relationship references in models
  
  check all migrations
  db:migrate
  db:seed
  check data in console
  commit, before installing Devise User, Devise Views



tweak Resource methods to handle Word, PDF, CSV, mp3, mp4 files
can I store a file in the database? no, store a link, it (the file) should live on GoogleDocs, Dropbox or a drive, not embedded as an object in the DB.

emailing with mailgun

document handling via GoogleDocs


