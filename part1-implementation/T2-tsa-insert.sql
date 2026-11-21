--T2-tsa-insert.sql

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

--------------------------------------
--INSERT INTO cabin
--------------------------------------
INSERT INTO cabin VALUES (
    1,
    1,
    1,
    2,
    'I',
    50,
    'Cozy cabin with a beautiful view of the mountains'
);

INSERT INTO cabin VALUES (
    1,
    2,
    2,
    4,
    'I',
    80,
    'Spacious cabin with modern amenities'
);

INSERT INTO cabin VALUES (
    1,
    3,
    1,
    2,
    'C',
    40,
    'Rustic cabin with access to a shared bathroom'
);

INSERT INTO cabin VALUES (
    2,
    1,
    2,
    4,
    'I',
    80,
    'Luxurious cabin with a private bathroom'
);

INSERT INTO cabin VALUES (
    2,
    2,
    3,
    6,
    'I',
    120,
    'Spacious cabin perfect for large families'
);

INSERT INTO cabin VALUES (
    3,
    1,
    1,
    2,
    'I',
    60,
    'Charming cabin near the lake'
);

INSERT INTO cabin VALUES (
    4,
    1,
    2,
    4,
    'C',
    50,
    'Cozy cabin with access to a shared bathroom'
);

INSERT INTO cabin VALUES (
    5,
    1,
    3,
    6,
    'I',
    100,
    'Modern cabin with scenic views'
);

INSERT INTO cabin VALUES (
    6,
    1,
    2,
    4,
    'I',
    90,
    'Secluded cabin with breathtaking mountain views'
);

INSERT INTO cabin VALUES (
    6,
    2,
    1,
    2,
    'C',
    40,
    'Cozy cabin with access to a shared bathroom near the forest'
);

INSERT INTO cabin VALUES (
    7,
    1,
    3,
    6,
    'I',
    120,
    'Luxurious cabin with a private bathroom and hot tub'
);

INSERT INTO cabin VALUES (
    7,
    2,
    1,
    2,
    'I',
    60,
    'Charming cabin with a private bathroom and garden view'
);

INSERT INTO cabin VALUES (
    7,
    3,
    2,
    4,
    'C',
    70,
    'Rustic cabin with access to a shared bathroom near the lake'
);

INSERT INTO cabin VALUES (
    8,
    1,
    1,
    2,
    'C',
    50,
    'Cozy cabin with access to a shared bathroom near the river'
);

INSERT INTO cabin VALUES (
    8,
    2,
    2,
    4,
    'I',
    90,
    'Cozy cabin with stunning sunset views'
);

INSERT INTO cabin VALUES (
    9,
    1,
    2,
    4,
    'I',
    80,
    'Modern cabin with stunning ocean views'
);

INSERT INTO cabin VALUES (
    9,
    2,
    1,
    2,
    'I',
    70,
    'Secluded cabin with a private bathroom and forest trails access'
);

INSERT INTO cabin VALUES (
    10,
    1,
    1,
    2,
    'I',
    60,
    'Quaint cabin with a private bathroom and fireplace'
);

INSERT INTO cabin VALUES (
    10,
    2,
    2,
    4,
    'I',
    100,
    'Modern cabin with oceanfront views and private balcony'
);

INSERT INTO cabin VALUES (
    10,
    3,
    3,
    6,
    'I',
    130,
    'Luxury cabin with a private bathroom, fireplace, and jacuzzi'
);

--------------------------------------
--INSERT INTO booking
--------------------------------------
INSERT INTO booking VALUES (
    1,
    1,
    1,
    TO_DATE('05-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('08-Mar-2023', 'dd-Mon-yyyy'),
    2,
    0,
    150,
    1,
    1
);

INSERT INTO booking VALUES (
    2,
    1,
    2,
    TO_DATE('10-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('15-Apr-2023', 'dd-Mon-yyyy'),
    4,
    0,
    400,
    2,
    2
);

INSERT INTO booking VALUES (
    3,
    2,
    1,
    TO_DATE('10-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('13-Mar-2023', 'dd-Mon-yyyy'),
    2,
    1,
    240,
    3,
    3
);

INSERT INTO booking VALUES (
    4,
    2,
    2,
    TO_DATE('18-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('22-Mar-2023', 'dd-Mon-yyyy'),
    3,
    2,
    480,
    4,
    4
);

INSERT INTO booking VALUES (
    5,
    3,
    1,
    TO_DATE('02-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('07-Mar-2023', 'dd-Mon-yyyy'),
    1,
    0,
    300,
    24,
    5
);

INSERT INTO booking VALUES (
    6,
    10,
    1,
    TO_DATE('10-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('17-Apr-2023', 'dd-Mon-yyyy'),
    1,
    1,
    420,
    6,
    18
);

INSERT INTO booking VALUES (
    7,
    4,
    1,
    TO_DATE('05-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('12-Mar-2023', 'dd-Mon-yyyy'),
    2,
    0,
    350,
    15,
    8
);

INSERT INTO booking VALUES (
    8,
    10,
    3,
    TO_DATE('15-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('20-Mar-2023', 'dd-Mon-yyyy'),
    2,
    3,
    650,
    8,
    18
);

INSERT INTO booking VALUES (
    9,
    5,
    1,
    TO_DATE('25-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('31-Mar-2023', 'dd-Mon-yyyy'),
    2,
    2,
    600,
    21,
    10
);

INSERT INTO booking VALUES (
    10,
    6,
    1,
    TO_DATE('12-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('20-Mar-2023', 'dd-Mon-yyyy'),
    4,
    0,
    720,
    10,
    12
);

INSERT INTO booking VALUES (
    11,
    1,
    1,
    TO_DATE('15-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('20-Mar-2023', 'dd-Mon-yyyy'),
    1,
    1,
    250,
    11,
    2
);

INSERT INTO booking VALUES (
    12,
    2,
    1,
    TO_DATE('10-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('15-Apr-2023', 'dd-Mon-yyyy'),
    2,
    0,
    400,
    12,
    4
);

INSERT INTO booking VALUES (
    13,
    3,
    1,
    TO_DATE('25-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('31-Mar-2023', 'dd-Mon-yyyy'),
    1,
    1,
    360,
    20,
    5
);

INSERT INTO booking VALUES (
    14,
    1,
    1,
    TO_DATE('22-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('24-Mar-2023', 'dd-Mon-yyyy'),
    2,
    0,
    100,
    14,
    1
);

INSERT INTO booking VALUES (
    15,
    2,
    1,
    TO_DATE('16-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('19-Apr-2023', 'dd-Mon-yyyy'),
    2,
    1,
    240,
    15,
    3
);

INSERT INTO booking VALUES (
    16,
    3,
    1,
    TO_DATE('20-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('22-Apr-2023', 'dd-Mon-yyyy'),
    1,
    0,
    120,
    3,
    7
);

INSERT INTO booking VALUES (
    17,
    6,
    2,
    TO_DATE('05-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('10-Apr-2023', 'dd-Mon-yyyy'),
    2,
    0,
    200,
    3,
    11
);

INSERT INTO booking VALUES (
    18,
    7,
    1,
    TO_DATE('15-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('20-Apr-2023', 'dd-Mon-yyyy'),
    3,
    1,
    600,
    1,
    14
);

INSERT INTO booking VALUES (
    19,
    8,
    1,
    TO_DATE('08-Apr-2023', 'dd-Mon-yyyy'),
    TO_DATE('12-Apr-2023', 'dd-Mon-yyyy'),
    1,
    0,
    200,
    2,
    16
);

INSERT INTO booking VALUES (
    20,
    9,
    1,
    TO_DATE('10-Mar-2023', 'dd-Mon-yyyy'),
    TO_DATE('15-Mar-2023', 'dd-Mon-yyyy'),
    2,
    1,
    400,
    3,
    17
);

COMMIT;