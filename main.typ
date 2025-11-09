#import "@preview/basic-resume:0.2.9": *

#let name = "Daniele Di Cesare"
#let location = "Verona, IT"
#let email = "dicesaredaniele7@gmail.com"
#let github = "github.com/DiCesareDaniele"
#let linkedin = "linkedin.com/in/ddc-dicesare"
#let phone = "+39 39 2531 4284"
#let personal-site = ""

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#000020",
  font: "New Computer Modern",
  font-size: 9pt,
  paper: "us-letter",
  author-position: left,
  personal-info-position: left,
)

#let lang-file = sys.inputs.at("lang-file", default: "langs/en.toml")
#let i18n = toml(lang-file)

== #i18n.education.title
#for section in i18n.education.section {
  [
    #edu(
      institution: section.institution,
      location: section.location,
      dates: dates-helper(start-date: section.start, end-date: section.end),
      degree: section.degree,
    )
    #for content in section.content {
      [- #content]
    }
  ]
}

== #i18n.experience.title
#for section in i18n.experience.section {
  [
    #work(
      title: section.title,
      location: section.location,
      company: section.company,
      dates: dates-helper(start-date: section.start, end-date: section.end),
    )
    #for content in section.content {
      [- #content]
    }
  ]
}

== #i18n.projects.title
#for section in i18n.projects.section {
  [
    #project(
      name: section.name,
      url: section.url,
    )
    #for content in section.content {
      [- #content]
    }
  ]
}

== #i18n.extra.title
#for section in i18n.extra.section {
  [
    #extracurriculars(
      activity: section.activity,
      dates: dates-helper(start-date: section.start, end-date: section.end),
    )
    #for content in section.content {
      [- #content]
    }
  ]
}

== #i18n.skills.title
#for section in i18n.skills.section {
  [
    - *#section.name*: #section.skills
  ]
}
