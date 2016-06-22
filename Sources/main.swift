import Kitura
import SwiftyJSON

let router = Router()

router.all(middleware: BodyParser())

router.get("/question") { req, res, next in
    // FIXME This is not actually a question!
    res.send(json: JSON([ "question": "As far as has ever been reported, no-one has ever seen an ostrich bury its head in the sand." ]))
    next()
}

router.post("/answer") { req, res, next in
    switch req.body {
        case .text(let answer)?:
            let correct = (answer == "true")
            res.send(json: JSON([ "correct": JSON(correct ? "true" : "false") ]))
        default:
            res.status(.badRequest)
    }
    next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
