
describe('Reply', function() {
    it('Reply', function() {
        cy.login()
        cy.visit('/questions')
        cy.contains('Edit').click()
        cy.visit('/questions')
        cy.get('[type="text"]').eq(1).type('Thank you for being a loyal member')
        cy.get('[type="submit"]').eq(1).click()
    })
})