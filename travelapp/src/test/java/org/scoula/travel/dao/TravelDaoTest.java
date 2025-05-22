package org.scoula.travel.dao;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.scoula.database.JDBCUtil;
import org.scoula.travel.domain.TravelImageVO;
import org.scoula.travel.domain.TravelVO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class TravelDaoTest {

    private TravelDao dao = new TravelDaoImpl();


    @AfterAll
    static void tearDown() {
        JDBCUtil.close();
    }

    @DisplayName("전체 여행지 개수 조회")
    @Test
    void getTotalCount() {
        int count = dao.getTotalCount();
        assertTrue(count > 0, "여행지 없음");
        System.out.println("여행지 개수: "+ count);
    }

    @Test
    void getDistricts() {
        List<String> districts = dao.getDistricts();

        assertNotNull(districts, "null 반환됨");
        assertFalse(districts.isEmpty(), "List가 비어있음");

        System.out.println("=== 지역목록 ===");
        districts.forEach(System.out::println);
    }

    @Test
    void getTravels() {
        List<TravelVO> travels = dao.getTravels();

        assertNotNull(travels, "null 반환됨");
        assertFalse(travels.isEmpty(), "List가 비어있음");

        System.out.println("=== 지역목록 ===");
        travels.forEach((travel) ->
                System.out.println(travel.getDistrict() +": "+travel.getTitle()));
    }

    @Test
    void testGetTravels() {
        int page = 1;

        List<TravelVO> travels = dao.getTravels(page);

        assertNotNull(travels);
        assertFalse(travels.isEmpty());
        assertTrue(travels.size()<=10);

        System.out.println("=== "+page +" 페이지 여행지목록 ===");
        travels.forEach(travel->
                System.out.println(
                        travel.getNo()+": "+
                        travel.getDistrict()+" - "+
                        travel.getTitle()
                ));
    }

    @Test
    void testGetTravels1() {
      String district = "강원권";

        List<TravelVO> travels = dao.getTravels(district);

        assertNotNull(travels);
        assertFalse(travels.isEmpty());

        System.out.println("=== "+district +" 페이지 여행지목록 ===");
        travels.forEach(travel->
                System.out.println(
                        travel.getNo()+": "+
                                travel.getDistrict()+" - "+
                                travel.getTitle()
                ));
    }

    @Test
    void getTravel() {

        Long travelNo = 1L;
        Optional<TravelVO> optionalTravel = dao.getTravel(travelNo);

        assertTrue(optionalTravel.isPresent(), "해당 번호의 여행지 정보 없음");

        TravelVO travel = optionalTravel.get();

        // 상세 정보 출력
        System.out.println("=== 여행지 상세 정보 ===");
        System.out.println("번호: " + travel.getNo());
        System.out.println("지역: " + travel.getDistrict());
        System.out.println("제목: " + travel.getTitle());
        System.out.println("설명: " + travel.getDescription());
        System.out.println("주소: " + travel.getAddress());
        System.out.println("전화번호: " + travel.getPhone());

        // 이미지 정보 확인
        if (travel.getImages() != null && !travel.getImages().isEmpty()) {
            System.out.println("=== 연관 이미지 정보 ===");
            travel.getImages().forEach(image ->
                    System.out.println("- " + image.getFilename()));
        } else {
            System.out.println("연관된 이미지가 없습니다.");
        }

    }
}