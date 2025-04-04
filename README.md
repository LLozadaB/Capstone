# Apopsis (Social Media App)

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

A social media app, loosely based on Discord. One tab can look at posts made
by the community. Another tab shows the user's editable profile.

### App Evaluation

- **Category:** Social
- **Mobile:** This app will probably not be as uniquely mobile as websites, although being able to talk to friends anywhere you go is a big selling point. Aside from that, my technological knowledge limits the app to a mobile version of a website.
- **Story:** This is an app that allows socialization with other people, and lets you create and customize your own profile. The value of this app is clear, as it will allow people to talk to each other easily and quickly. My friends would probably respond well to this idea.
- **Market:** The market for this app would most likely be large and general, the user base able to go from just about anyone who's interested in socializing. It doesn't provide huge value for a niche group, though.
- **Habit:** This app would be quite habit-forming, as you'll use it to talk to your friends from wherever you are. An average user would use this app very often, too. They can use it to create content as well.
- **Scope:** The idea is rather well-formed. I know what to make the tabs, and the main content of the app. However, technical challenges would revolve around the API, as in how I'm going to get posts, show them, what kind of posts, etc. What I want to build is well-defined, though.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* A screen that shows community posts.
* Posts can be tapped to fully view image and text.
* A screen that shows the user's profile.
* The user's profile can be edited and saved.

**Optional Nice-to-have Stories**

* Add a profile image to the profile screen that can be changed.

### 2. Screen Archetypes

- [ ] Posts Screen
* A table view that shows posts made by the community. Shows images, if any,
texts, labels and etc. Screen can be scrolled if there are enough posts.

- [ ] Profile Screen
* A screen of your own personal profile. Has a username, and a biography section
that can be edited by the user.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Posts Tab
* Profile Tab

**Flow Navigation** (Screen to Screen)

- [ ] Posts Screen
* Posts can be tapped on to fully view their images and text content.
  
- [ ] Profile Screen
* Can tap an edit button to edit your user profile, and save it with User Defaults.

## Wireframes

<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- Network requests for posts and their images, text, labels, etc.
- Will request many different posts to show simultaneously.
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
