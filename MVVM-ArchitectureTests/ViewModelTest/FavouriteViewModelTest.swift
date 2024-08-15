//
//  FavouriteViewModelTest.swift
//  MVVM-Architecture
//
//  Created by russel on 15/8/24.
//

import XCTest
import Combine

@testable import MVVM_Architecture

class FavouriteViewModelTest: XCTestCase {
    var sut: FavouriteViewModel!
    var mockStorageService: MockFavouriteStorageService!
    
    var firstData: PokemonDetailModel!
    var secondData: PokemonDetailModel!
    var thirdData: PokemonDetailModel!
    
    override func setUpWithError() throws {
        mockStorageService = MockFavouriteStorageService()

        sut = FavouriteViewModel(favouriteStorageService: mockStorageService)
        
        firstData = PokemonDetailModel(
            height: 6,
            name: "bulbasaur",
            sprites: SpritesModel(frontDefault: "https://pokeapi.co/api/v2/pokemon/1/"),
            weight: 8)
        
        secondData = PokemonDetailModel(
            height: 4,
            name: "ivysaur",
            sprites: SpritesModel(frontDefault: "https://pokeapi.co/api/v2/pokemon/2/"),
            weight: 5)
        
        thirdData = PokemonDetailModel(
            height: 4,
            name: "venusaur",
            sprites: SpritesModel(frontDefault: "https://pokeapi.co/api/v2/pokemon/3/"),
            weight: 5)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockStorageService = nil
        firstData = nil
        secondData = nil
        thirdData = nil
        super.tearDown()
    }
    
    func test_saveThreeFavouritesInDb_retieveThreeFavouritesFromDB() {
        mockStorageService.storageProvider.saveData(data:firstData)
        mockStorageService.storageProvider.saveData(data:secondData)
        mockStorageService.storageProvider.saveData(data:thirdData)
        
        XCTAssertEqual(mockStorageService.getAllFavourites().count, 3)
        
        sut.getAllFavourites()
        
        XCTAssertEqual(sut.detailData.count, 3)
    }
    
    func test_saveThreeFavouritesInDb_deleteOne_shouldReturnTwoFavouritesFromDB() {
        mockStorageService.storageProvider.saveData(data:firstData)
        mockStorageService.storageProvider.saveData(data:secondData)
        mockStorageService.storageProvider.saveData(data:thirdData)
        
        XCTAssertEqual(mockStorageService.getAllFavourites().count, 3)
        
        sut.deleteFavourite(data: secondData)
        
        XCTAssertEqual(mockStorageService.getAllFavourites().count, 2)
    }
}
