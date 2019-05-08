
describe('View Profile', () => {
    it('view profile', () => {
        cy.login()
        cy.visit('/profile?')
        cy.contains("Bookmarks").click()
    })
})