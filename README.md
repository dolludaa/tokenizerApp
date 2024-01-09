# Multilingual Tokenizer

## Overview
The Multilingual Tokenizer is a specialized text processing tool designed to tokenize sentences based on specific keywords. This tokenizer is particularly adept at handling texts in both English and Spanish, identifying and using language-specific keywords to delineate sentences.

<img align="right" width="20%" src="https://github.com/dolludaa/WeatherApp1/assets/111228178/d5089444-ab99-41a1-812e-e8fd75294656">


## Why MVC?
This project employs the Model-View-Controller (MVC) architecture for several reasons:
- **Separation of Concerns**: MVC divides the application into three interconnected components, allowing for independent development, maintenance, and testing of each part.
- **Improved Organization**: The MVC pattern provides a clean separation of the UI (View), the logic (Controller), and the data (Model), making the code more organized and manageable.
- **Scalability and Flexibility**: MVC architecture makes it easier to scale the application and integrate new features or languages in the future.
- **Enhanced Collaboration**: Different team members can work on the model, view, and controller independently, facilitating team collaboration and parallel development.

## Features
- **Language-Specific Tokenization**: The tokenizer can process text in either English or Spanish.
  - In English, it tokenizes sentences at occurrences of the words "if" and "and".
  - In Spanish, it uses "si" and "y" as the tokenization triggers.
- **User-Friendly Interface**: Simple and intuitive UI for easy interaction.

<img align="right" width="20%" src="https://github.com/dolludaa/WeatherApp1/assets/111228178/3c0e1c2d-e07a-4e6c-9579-69fc13349b08">


## How It Works
The tokenizer reads a block of text and splits it into sentences. The splitting is based on the occurrence of specific keywords, which vary depending on the selected language. For English, the keywords are "if" and "and"; for Spanish, "si" and "y". Each appearance of these words signifies the start of a new sentence.

## Usage
1. **Input Text**: Enter the text you want to tokenize in the input field.
2. **Select Language**: Choose the language of the input text (English or Spanish).
3. **Tokenize**: Click the 'Tokenize' button to process the text.
4. **Output**: The tokenized text will be displayed, with each new sentence separated by a newline.

## Setup and Installation
1. **Clone the Repository**: `git clone [repository_url]`
2. **Navigate to Directory**: `cd [local_repository]`
3. **Install Dependencies**: Follow the instructions in the installation guide.
4. **Run the Application**: Follow the start-up guide to launch the application.
