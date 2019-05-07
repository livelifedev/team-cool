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
        cy.get('[id="user_first_name"]').type(user.first_name)
        cy.get('[id="user_surname"]').type(user.surname)
        cy.get('[id="user_username"]').type(user.username)
        cy.get('[id="user_birthday"]').type(user.birthday)
        cy.get('[id="user_school"]').type(user.school)
        cy.get('[id="user_email"]').type(user.email)
        cy.get('[id="user_password"]').type(user.password)
        cy.get('[id="user_password_confirmation"]').type(user.password_confirmation)
        cy.get('[type="submit"]').contains('Sign up').click()
        cy.get('[id="stripePayment]').contains('Pay here').click()
    })
})