
describe('Search Document', function() {
    it('Search Docs', function() {
        cy.login()
        cy.visit('/documents/search')
        cy.get('[id="search"]').type('history')
        cy.get('[id="q_g_0_c_0_v_0_value"]').type('ancient history')
        cy.get('button').click()
    })
})