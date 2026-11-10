data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade) 
    | intensidade >= 8 = "Forte" 
    | intensidade >= 5 = "Equilibrado" 
    | otherwise = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
    if comLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
    let cafeSuave = Cafe "Cafe Suave" 5.50 3
    let cafeEquilibrado = Cafe "Leblanc Special Blend" 7.00 6
    let cafeForte = Cafe "Espresso Intenso" 6.50 9

    putStrLn (descrever cafeSuave ++ " - Forca: " ++ forca cafeSuave)
    putStrLn (descrever cafeEquilibrado ++ " - Forca: " ++ forca cafeEquilibrado)
    putStrLn (descrever cafeForte ++ " - Forca: " ++ forca cafeForte)

    putStrLn "\nPreco do Leblanc Special Blend com leite:"
    print (precoDoPedido True cafeEquilibrado)

    putStrLn "Preco do Leblanc Special Blend sem leite:"
    print (precoDoPedido False cafeEquilibrado)
