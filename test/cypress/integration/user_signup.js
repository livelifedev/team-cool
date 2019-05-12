const user = {
    first_name: 'Nathan',
    surname: 'Tuey',
    username: 'natuey',
    gender: 'male',
    birthday: '2001-07-19',
    school: 'Coder Academey',
    email: 'nathantuey@gmail.com',
    password: 'thuy1907',
    password_confirmation: 'thuy1907'
}

describe('User Sign Up', () => {
    it("signup", () => {
        cy.visit('/users/sign_up')
        cy.get('[id="firstName"]').type(user.first_name)
        cy.get('[id="lastName"]').type(user.surname)
        cy.get('[id="username"]').type(user.username)
        cy.get('[id="datetimepicker1"]').type(user.birthday)
        cy.get('[id="school"]').type(user.school)
        cy.get('[id="email"]').type(user.email)
        cy.get('[id="firstname"]').type(user.password)
        cy.get('[id="user_password_confirmation"]').type(user.password_confirmation)
        cy.get('[type="submit"]').contains('Continue').click()
        cy.get('button').click()      
    })
})
