describe('Contact Us', function() {
    it('Contact Us', function() {
        cy.login()
        cy.visit('/questions/new')
        cy.get('[id="question_email"]').type("test@test.com")
        cy.get('[id="question_content"]').type("Can I get reward for referral?")
        cy.get('[type="submit"]').click()
    })
})

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

