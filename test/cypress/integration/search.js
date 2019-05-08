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


describe('Search Document', function() {
    it('Search Docs', function() {
        cy.visit('/users/sign_in')
        cy.get('[type="email"]').type(user.email)
        cy.get('[type="password"]').type(user.password)
        cy.get('form').contains('Log in').click()
        
        cy.visit('/documents/search')
        cy.get('[id="search"]').type('history')
        cy.get('[id="q_g_0_c_0_v_0_value"]').type('ancient history')
        cy.get('button').click()
    })
})