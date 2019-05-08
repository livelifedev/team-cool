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


describe('Create New Document', function() {
    it('Create New Doc', function() {
        cy.visit('/users/sign_in')
        cy.get('[type="email"]').type(user.email)
        cy.get('[type="password"]').type(user.password)
        cy.get('form').contains('Log in').click()

        cy.visit('/documents/new')
        cy.get('[id="document_title"]').type("Ancient History")
        cy.get('[id="document_description"]').type("How the Roman Empire fell")
        cy.get('[id="document_doc_type_essay"]').click()
        cy.get('[type="submit"]').click()
    })
})
